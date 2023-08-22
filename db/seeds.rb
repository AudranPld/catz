# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

cat1 = { name: 'Mimi', adress: 'Bordeaux', gender: "Female", breed: "Ragdoll", price: 25 }
cat2 = { name: 'Chouchou', adress: 'Paris', gender: "Male", breed: "British Short Hair", price: 50 }


10.times do
  email = Faker::Internet.email
  password = Faker::Internet.password(min_length: 8)
  user = { email: email, password: password }
  puts user
  User.create!(user)
end


puts 'Created cat'
