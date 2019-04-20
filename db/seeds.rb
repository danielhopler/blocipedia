# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
require 'random_data'
require 'faker'

5.times do
  User.create!(
    username: Faker::Movies::HarryPotter.character,
    email: Faker::Internet.email,
    password: 'password',
    confirmed_at: Time.now
  )
end

users = User.all

20.times do
  Wiki.create!(
    user: users.sample,
    title: Faker::Movies::HarryPotter.book,
    body: Faker::Movies::HarryPotter.quote
  )
end

wikis = Wiki.all

admin = User.create!(
  username: 'Admin',
  email: 'admin@example.com',
  password: 'password',
  confirmed_at: Time.now,
  role: 'admin'
)

premium = User.create!(
  username: 'Premium',
  email: 'premium@example.com',
  password: 'password',
  confirmed_at: Time.now,
  role: 'premium'
)

standard = User.create!(
  username: 'Standard',
  email: 'standard@example.com',
  password: 'password',
  confirmed_at: Time.now,
)



puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
puts "#{User.standard.count} standard users created"
puts "#{User.admin.count} admin created"
puts "#{User.premium.count} premium created"
