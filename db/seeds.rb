

puts "Starting seed"

User.destroy_all()
Cat.destroy_all()
Reservation.destroy_all()

rand(10..20).times do
  user = User.create({ email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8) })
  rand(1..3).times do
    cat = Cat.create({
      name: ["Whiskers", "Fluffy", "Mittens", "Nibbles", "Sprinkles", "Snuggles", "Paws", "Muffin", "Sunny", "Bubbles", "Cheddar", "Peanut", "Cupcake", "Cinnamon", "Gingersnap", "Fudge", "Tootsie", "Popcorn", "Waffles", "Squeaky"].sample    ,
      adress: Faker::Internet.email,
      gender: ["male", "female"].sample,
      breed: ["Siamese", "Persian", "Maine Coon", "Ragdoll", "Bengal", "Sphynx", "Abyssinian", "British Shorthair", "Scottish Fold", "Russian Blue"].sample,
      price: rand(5..50)
      })

    rand(1..3).times do
      dat = Faker::Date.between(from: Date.new(2000, 1, 1), to: Date.today)
      Reservation.create({
        starting_date: dat,
        ending_date: dat,
        user: user,
        cat: cat
      })
    end
  end
end
puts 'Done'
