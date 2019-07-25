Restaurant.destroy_all if Rails.env.development?
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do
  restaurant = Restaurant.create!(name: Faker::Restaurant.name,
                                  address: Faker::Address.street_address,
                                  phone_number: Faker::PhoneNumber.cell_phone,
                                  category: ["chinese", "italian", "japanese", "french", "belgian"].sample)
  7.times do
  restaurant.reviews.create!(content: Faker::Restaurant.review,
                            rating: rand(0..5))
  end
end

puts "created #{Restaurant.count} restaurants and their reviews!"
