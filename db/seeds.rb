# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Rental.destroy_all
Surfboard.destroy_all
User.destroy_all


puts 'Creating 20 fake users and boards...'
20.times do
  user = User.new(
    name: Faker::Name.first_name,
    surname: Faker::Name.last_name,
    password: "123456789")
  user.email = "#{user.name}.#{user.surname}@gmail.com"
  user.save!

  surfboard = Surfboard.new(
    material_type:    ["Epoxy", "Polyester", "100% Carbon", "Polystyrene", "Fiberglass"].sample,
    brand:    ["South Bay Board Co", "Wave Bandit", "Wavestorm", "BIC Sport", "Thurso Surf"].sample,
    price:    rand(0..1000).round(2),
    description: "This is a very beautiful surfboard!",
    shape:    ["Longboard", "Shortboard", "Fish", "Egg", "Hybrid", "Funboard"].sample,
    lenght:   rand(6.0..9.0).round(1),
    address:  Faker::Address.full_address,
    user_id:  user.id,
    )
    surfboard.save!

end
puts "Creating 10 rentals..."
10.times do
rental = Rental.new(
    starting_date: Date.today,
    return_date: Faker::Date.forward(days: 30),
    booking_status: ["Pending", "Accepted"].sample,
    user_id:  User.ids.sample,
    surfboard_id:  Surfboard.ids.sample,
  )
  rental.save!
end
# puts 'Creating 20 fake surfboards...'
# 20.times do
#   surfboard = Surfboard.new(
#     material_type:    ["Epoxy", "Polyester", "100% Carbon", "Polystyrene", "Fiberglass"].sample,
#     brand:    ["South Bay Board Co", "Wave Bandit", "Wavestorm", "BIC Sport", "Thurso Surf"].sample,
#     price:    rand(0..100),
#     shape:    ["Longboard", "Shortboard", "Fish", "Egg", "Hybrid", "Funboard"].sample,
#     lenght:   rand(6.0..9.0).round(1),
#     address:  Faker::Address.full_address,
#     user_id:  user.id,
#   )
#   surfboard.save!
# end
