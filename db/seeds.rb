# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
	email: 'greenlin111@gmail.com',
	password: 'password',
	password_confirmation: 'password',
	admin: true)

categories = %w(Books Clothes 3C Groceries Food Music)

categories.each do |name|
	category= Category.create!(
		name: :name, description: Faker::Lorem.sentences(rand(3..5)).join
		)

	rand(20..25).times do
		name = Faker::Commerce.product_name
		friendly_id = name.downcase.to_param.gsub(' ','-')
		category.products.create!(
			name: name,
			description: Faker::Lorem.sentences(rand(1..3)).join,
			content: Faker::Lorem.paragraphs(rand(10..12)).join("\n"),
			price: Faker::Commerce.price * 100,
			active: true
			friendly_id: friendly_id
			)
	end
end