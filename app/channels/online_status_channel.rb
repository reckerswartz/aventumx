# frozen_string_literal: true

class OnlineStatusChannel < ApplicationCable::Channel
  def subscribed
    current_user.online! if current_user.offline?
  end

  def unsubscribed
    current_user.offline! if current_user.online?
  end
end
