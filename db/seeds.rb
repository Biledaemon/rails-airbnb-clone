# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
4.times do
  user = User.new(email: Faker::Internet.email, password: 123456)
  user.save!
  3.times do
    car = Car.new(
      brand: Faker::Vehicle.make,
      model: Faker::Vehicle.model,
      price: rand(100..5000),
      capacity: rand(1..7),
      rating: rand(1..10)
    )
    car.user = user
    car.save!

    puts "saved correctly"
  end
end
