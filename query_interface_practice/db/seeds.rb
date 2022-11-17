# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require_relative '../lib/populator_fix'

Country.populate 5 do |u|
  u.gdp = Faker::Number.number(digits: 10) # gdp in billions
  u.name = Faker::Address.country
end

Person.populate 5 do |u|
  u.birth_date = Faker::Date.birthday(min_age: 18, max_age: 65)
  u.country_id = Faker::Number.between(from: 1, to: 5)
  u.first_name = Faker::Name.first_name
  u.last_name = Faker::Name.last_name
end

Company.populate 5 do |u|
  u.country_id = Faker::Number.between(from: 1, to: 5)
  u.market_value = Faker::Number.number(digits: 8)
  u.name = Faker::Company.name
end
