# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Car.destroy_all

# puts "Creating cars ..."

# car1 = Car.create!({
#     name: "Batmobile",
#     category: "Road",
#     address: "Gotham City",
#     price: 4000,
#     capacity: 2,
#     features: "Machine Gun",
#     summary: "Brand new Batmobile ! Super usefull to beat Joker ass",
#     engine: "Nuclear"
#   })

# car2 = Car.create!({
#     name: "Banana Car",
#     category: "Road",
#     address: "Banana City",
#     price: 300,
#     capacity: 5,
#     features: "Banana bar onboard",
#     summary: "Monkey rent car you give me money",
#     engine: "Banana Juice"
#   })
puts "Creating cars ..."
users = []
5.times do
  user_new = User.create(
    email: Faker::Internet.email,
    first_name: Faker::Name.name,
    last_name: Faker::Name.name,
    password: Faker::Name.name,
  )
  users << user_new
end

users.each do |user|
  5.times do
    car = Car.create(
        name: Faker::Name.name,
        category: "Road",
        address: "rue de Paris",
        price: Faker::Number.positive,
        capacity: 2,
        features: "Machine Gun",
        summary: "Brand new car ! Super usefull",
        engine: "Nuclear",
        image:
        user: user
      )
  end
end

puts "seeding done"