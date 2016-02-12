# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# create basic user
user = User.create(
  username: 'John Doe',
  email: 'email@email.com',
  password: '1234')
user.save

# create admin
user2 = User.create(
  username: 'Administrator',
  email: 'admin@email.com',
  password: '1234',
  admin: true)
user2.save

10.times do
  User.create!(username: Faker::Name.name, email: Faker::Internet.email, password: 'password')
end

# create Categories
Category.create!(name: "Gourmand's Delight")
Category.create!(name: "Novelty Socks")
Category.create!(name: "Deep Web")
Category.create!(name: "Beanie Babies")
Category.create!(name: "Baby Products")
Category.create!(name: "Cosplay")
Category.create!(name: "Dinosaurs")
Category.create!(name: "Pizza Accessories")
Category.create!(name: "Vintage Tees")
Category.create!(name: "Candy")

20.times do
  new_item = Item.create!(
    title: Faker::Commerce.product_name,
     price: Faker::Commerce.price,
     description: Faker::Lorem.paragraph(3),
     quantity: rand(1...20),
     user_id: 2,
     picture_link: Faker::Avatar.image(Faker::Name.first_name, "200x200"))
  new_item.categories << Category.find(rand(1...3))
  new_item.categories << Category.find(rand(4...7))
  new_item.categories << Category.find(rand(8...10))
end

3.times do
  out_of_stock_item = Item.create!(
    title: Faker::Commerce.product_name,
     price: Faker::Commerce.price,
     description: "This items should be out of stock by default. Don't get your hopes up, kid.",
     quantity: 0,
     user_id: 2,
     picture_link: Faker::Avatar.image(Faker::Name.first_name, "200x200"))
  out_of_stock_item.categories << Category.find(rand(1...3))
  out_of_stock_item.categories << Category.find(rand(4...7))
  out_of_stock_item.categories << Category.find(rand(8...10))
end

10.times do |i|
  category = Category.find(i+1)
  category.items << Item.find(rand(1...20))
end






