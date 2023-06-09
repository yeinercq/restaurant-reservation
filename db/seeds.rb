# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


for i in 1..2
  Restaurant.create!(
    name: "Restaurant #{i}",
    description: "Description for restaurant #{i}",
    address: "#Adress",
    city: "Bogota DC."
  )
end

for j in 1..10
  Restaurant.first.reservations.create!(
    booking_date: Date.today
  )
end

for j in 1..9
  Restaurant.second.reservations.create!(
    booking_date: Date.today
  )
end

puts "Restaurants and reservations has been created."
