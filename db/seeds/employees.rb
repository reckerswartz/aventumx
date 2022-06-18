# frozen_string_literal: true

# This file contains app data for seeding purposes
# load Rails.root.join('db/seeds/*.rb') ; AppSeeds::ClassName.seed

module AppSeeds
  class Employees
    class << self
      def seed
        users_attrs = [
          {
            first_name: 'Aventum',
            last_name: 'Cormac',
            email: 'aventumcormac@gmail.com'
          },
          {
            first_name: 'Rupinder',
            last_name: 'Kaur',
            email: 'rupinder007gill@gmail.com'
          }
        ]

        users_attrs.each do |user_attr|
          next unless User.find_by(email: user_attr[:email]).nil?

          u = User.new(user_attr)
          u.password = 'teste12345'
          u.skip_confirmation!
          u.save(validate: false)
          u.add_role(:employee)
          Rails.logger.debug { "Client #{u.email} created" }
        end
      end
    end
  end
end
