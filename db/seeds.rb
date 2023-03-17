# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "🌱 Seeding..."

20.times do
    Restaurant.create(
        name:Faker::Restaurant.name,
        address:Faker::Address.secondary_address
    )
end

20.times do
    Pizza.create(
        name:Faker::Food.dish,
        ingredients:Faker::Food.ingredient
    )
end

20.times do
    Restaurantpizza.create(
        pizza_id:Faker::Number.within(range: 1..20),
        restaurant_id:Faker::Number.within(range: 1..20),
        price:Faker::Number.within(range: 1..30)
    )
end

puts "🌱 Done seeding ✅"