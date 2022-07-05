# frozen_string_literal: true

class MessageBuilder
  pattr_initialize %i[receiver_username! content! chat_room_username current_user]

  def perform
    ## if message is sent to a channel, find the channel
    if chat_room_username.present? && find_room(chat_room_username).present?
      build_message_to_room
    else
      build_message_to_user
    end
  end

  private

  def find_room(username)
    # check if the channel exists and if the user is a member of the room
    @chat_room if (@chat_room = ChatRoom.find_by(username:)).present? && @chat_room.members.include?(current_user)
  end

  def build_message_to_room
    ActiveRecord::Base.transaction do
      @chat_room.messages.new(content:, sender: current_user)
    rescue StandardError => e
      Rails.logger.error e
      raise e
    end
  end

  def build_message_to_user
    @receiver = User.find_by(username: receiver_username)
    if @receiver.present?
      ## if the user exists, find the room between the receiver user and the current user
      @chat_room = ChatRoom.find_by(owner: @receiver, sender: current_user, is_direct: true)
      ## if the channel exists, create the message
      if @chat_room.present?
        ActiveRecord::Base.transaction do
          @message = @chat_room.messages.new(content:, sender: current_user)
        rescue StandardError => e
          Rails.logger.error e
          raise e
        end
      else
        ActiveRecord::Base.transaction do
          ## if the channel does not exist, create the channel
          @chat_room = ChatRoom.create(owner: @receiver, sender: current_user, is_direct: true)
          ## create the message
          @chat_room.messages.new(content:, sender: current_user)
        rescue StandardError => e
          Rails.logger.error e
          raise e
        end
      end
    end
  end
end
