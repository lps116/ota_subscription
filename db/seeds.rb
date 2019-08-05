# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "clearing database..."
Order.destroy_all
Plan.destroy_all
Trade.destroy_all
User.destroy_all

puts "generating users..."
10.times do
  User.create!({
    email: Faker::Internet.unique.email,
    password: "123123",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  })
end

puts "generating trades for users..."

User.all.each do |user|
  8.times do
    Trade.create!({
      instrument: ["Gold", "DAX", "Bitcoin", "FTSE", "EUR/USD", "Crude Oil", "GBP/USD", "Brent Oil", "Silver", "S&P 500", "Natural Gas", "USD/JPY", "Dow 30", "Copper", "NASDAQ"].sample,
      direction: ["buy", "sell"].sample,
      exit: [22, 33, 44, 55, 66, 45, 32, 100 ,23].sample,
      entry: [22, 33, 44, 55, 66, 45, 32, 100 ,23].sample,
      open: [true, false].sample,
      user: user
    })
  end
end

puts "finished"
