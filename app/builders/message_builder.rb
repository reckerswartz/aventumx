# frozen_string_literal: true

class MessageBuilder
  pattr_initialize %i[receiver_username! content! chat_channel_username current_user]

  def perform
    ## if message is sent to a channel, find the channel
    if chat_channel_username.present? && find_channel(chat_channel_username).present?
      build_message_to_channel
    else
      build_message_to_user
    end
  end

  private

  def find_channel(username)
    # check if the channel exists and if the user is a member of the channel
    @chat_channel if (@chat_channel = ChatChannel.find_by(username:)).present? && @chat_channel.members.include?(current_user)
  end

  def build_message_to_channel
    ActiveRecord::Base.transaction do
      @chat_channel.messages.new(content:, sender: current_user)
    rescue StandardError => e
      Rails.logger.error e
      raise e
    end
  end

  def build_message_to_user
    @receiver = User.find_by(username: receiver_username)
    if @receiver.present?
      ## if the user exists, find the channel between the receiver user and the current user
      @chat_channel = ChatChannel.find_by(owner: @receiver, sender: current_user, is_private: true)
      ## if the channel exists, create the message
      if @chat_channel.present?
        ActiveRecord::Base.transaction do
          @message = @chat_channel.messages.new(content:, sender: current_user)
        rescue StandardError => e
          Rails.logger.error e
          raise e
        end
      else
        ActiveRecord::Base.transaction do
          ## if the channel does not exist, create the channel
          @chat_channel = ChatChannel.create(owner: @receiver, sender: current_user, is_private: true)
          ## create the message
          @chat_channel.messages.new(content:, sender: current_user)
        rescue StandardError => e
          Rails.logger.error e
          raise e
        end
      end
    end
  end
end
