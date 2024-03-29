# frozen_string_literal: true

# This file contains app data for seeding purposes
# load Rails.root.join('db/seeds/*.rb') ; AppSeeds::ClassName.seed

module AppSeeds
  class Admins
    class << self
      def seed
        users_attrs = [
          {
            first_name: 'recker',
            last_name: 'swartz',
            email: 'reckerswartz@hotmail.com'
          }
        ]

        users_attrs.each do |user_attr|
          next unless User.find_by(email: user_attr[:email]).nil?

          u = User.new(user_attr)
          u.password = 'teste12345'
          u.skip_confirmation!
          u.save(validate: false)
          u.add_role(:admin)
          Rails.logger.debug { "Admin #{u.email} created" }
        end
      end
    end
  end
end
