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
	admin: true
)

categories = {
	'Books' => ['Programming', 'Comics', 'Novel', 'Literature'],
	'Clothes' => ['Hat', 'Pants', 'Coat', 'Jacket', 'Shoes'],
	'3C' => ['Computer', 'Mobile Phone', 'TV', 'Laptop', 'Tablet'],
	'Groceries' => ['Stationery', 'Tools', 'Doll', 'Toys'],
	'Food' => ['Noodle', 'Rice', 'Drinks', 'Vegetable']
}

categories.each do |name, subs|
	category= Category.create!(
		name: name, description: Faker::Lorem.sentences(rand(3..5)).join
	)
	
	subs.each do |subname| 
		subcategory = category.children.create!(name: subname, description: Faker::Lorem.sentences(rand(1..2)).join
		)

		rand(20..25).times do
			subcategory.products.create!(
				name: Faker::Commerce.product_name,
				description: Faker::Lorem.sentences(rand(1..2)).join,
				content: Faker::Lorem.paragraphs(rand(5..8)).join("\n"),
				price: Faker::Commerce.price * 30,
				active: true,
				shelved_on: Date.current
			)
		end
	end
end