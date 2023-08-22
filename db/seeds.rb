# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

cat1 = { adress: 'Bordeaux', sex: "F", breed: "Ragdoll", price: 25}
cat2 = { adress: 'Paris', sex: "M", breed: "British Short Hair", price: 50}

[cat1, cat2].each do |attributes|
  cat = Cat.create!(attributes)
  puts 'Created cat'
end
