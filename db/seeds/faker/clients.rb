# frozen_string_literal: true

# This file contains app data for seeding purposes
# load Rails.root.join('db/seeds/*.rb') ; AppSeeds::ClassName.seed

require 'faker'
require 'factory_bot'
include FactoryBot::Syntax::Methods

module AppSeeds
  class FakerClients
    class << self
      def seed
        20.times do
          user_attr = attributes_for(:client)
          next unless User.find_by(email: user_attr[:email]).nil?

          u = User.new(user_attr)
          u.password = 'teste12345'
          u.skip_confirmation!
          u.save(validate: false)
          Rails.logger.debug { "Client #{u.email} created" }
        end
      end
    end
  end
end
