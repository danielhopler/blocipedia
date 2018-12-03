# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'random_data'

5.times do
   User.create!(
 # #3
   username: RandomData.random_name,
   email:    RandomData.random_email,
   password: "password"
   )
 end
 users = User.all

 20.times do
	Wiki.create!(
		user:   users.sample,
		title:  RandomData.sentence,
		body:   RandomData.paragraph
	)
end
posts = Post.all

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Wiki.count} topics created"
