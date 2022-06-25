# frozen_string_literal: true

module ApplicationCable
  # The connection.rb file is where authorization and authentication logic lives.
  # Currently the application has authentication setup elsewhere.
  # We will only be setting up authorization to the Websocket connection.
  class Connection < ActionCable::Connection::Base
    # Authorizing connection request

    # When you subscribe to a channel the authorization will trigger in the connection class.
    # The Connection class responsibility is authorization and authentication.
    # Currently the application has authentication setup in the SessionsController.
    # We will only implement authorization within the Connection class and
    # utilizing the session created through the SessionsController.
    # We will want to set up a connect method.
    # The connect method triggers when you attempt to subscribe to a channel.
    # We will want to authorize the connection only if the user is logged in.
    # Otherwise, we will want to reject the connection request.

    # identified_by allows us to reference current_user within our channels and find the specific connection again.
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      # If the user is logged in, we will find the user and return it.
      # find the user by the session id from the session cookie
      if (verified_user = env['warden'].user)
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
