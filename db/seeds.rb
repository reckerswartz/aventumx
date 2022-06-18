# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# load other seeds
Dir['db/seeds/**/*.rb'].each { |f| require Rails.root.join(f) }
AppSeeds::Admins.seed
AppSeeds::Employees.seed
AppSeeds::Clients.seed

return if Rails.env.production?

AppSeeds::FakerAdmins.seed
AppSeeds::FakerEmployees.seed
AppSeeds::FakerClients.seed
