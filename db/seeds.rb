# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

User.create!(name: 'John Doe', email: 'email@email.com', password_hash: '1234')

10.times do
  User.create!(name: Faker::Name.name, email: Faker::Internet.email, password_hash: 'password')
end

20.times do
  Item.create!(title: Faker::Commerce.product_name,
               price: Faker::Commerce.price,
               description: Faker::Lorem.paragraph,
               quantity: rand(1...20),
               user_id: (1..11).to_a.sample)
end
