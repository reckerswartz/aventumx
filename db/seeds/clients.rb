# frozen_string_literal: true

# This file contains app data for seeding purposes
# load Rails.root.join('db/seeds/*.rb') ; AppSeeds::ClassName.seed

module AppSeeds
  class Clients
    class << self
      def seed
        users_attrs = [
          {
            first_name: 'Martin',
            last_name: 'Fowler',
            email: 'client@test.com'
          },
          {
            first_name: 'Martin',
            last_name: 'Fowler',
            email: 'rob@test.com'
          }
        ]

        users_attrs.each do |user_attr|
          next unless User.find_by(email: user_attr[:email]).nil?

          u = User.new(user_attr)
          u.password = 'teste12345'
          u.skip_confirmation!
          u.save(validate: false)
          u.add_role(:client)
          Rails.logger.debug { "Client #{u.email} created" }
        end
      end
    end
  end
end
