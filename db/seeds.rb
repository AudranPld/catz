
require 'open-uri'

puts "Starting seed"

User.destroy_all()
Cat.destroy_all()
Reservation.destroy_all()

cat_image_urls = {
  "Whiskers" => "https://res.cloudinary.com/diftob25x/image/upload/v1692710440/scottishfield_o4bek0.jpg",
  "Fluffy" => "https://res.cloudinary.com/diftob25x/image/upload/v1692710440/ragdoll_fxj0z6.png",
  "Mittens" => "https://res.cloudinary.com/diftob25x/image/upload/v1692710440/russianblue_calvtw.jpg",
  "Nibbles" => "https://res.cloudinary.com/diftob25x/image/upload/v1692710440/sphynx_rqo9qs.jpg",
  "Sprinkles" => "https://res.cloudinary.com/diftob25x/image/upload/v1692710440/siamese_h9xnzf.jpg",
  "Snuggles" => "https://res.cloudinary.com/diftob25x/image/upload/v1692710439/britishshorthair_qaczby.jpg",
  "Paws" => "https://res.cloudinary.com/diftob25x/image/upload/v1692710439/mainecoon_gldecc.jpg",
  "Muffin" => "https://res.cloudinary.com/diftob25x/image/upload/v1692710439/abyssinian_y4d7g7.jpg",
  "Sunny" => "https://res.cloudinary.com/diftob25x/image/upload/v1692710439/persian_gignx9.webp",
  "Bubbles" => "https://res.cloudinary.com/diftob25x/image/upload/v1692710439/bengal_ikfa49.jpg"
}

cats_name = cat_image_urls.keys

5.times do
  user = User.create({ email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8) })
  2.times do
    cat_name = cats_name.sample
    cats_name.delete(cat_name)
    cat = Cat.new({
      name: cat_name,
      gender: ["male", "female"].sample,
      adress: Faker::Internet.email,
      breed: ["Siamese", "Persian", "Maine Coon", "Ragdoll", "Bengal", "Sphynx", "Abyssinian", "British Shorthair", "Scottish Fold", "Russian Blue"].sample,
      price: rand(5..50),
      user_id: user.id
    })
    url = cat_image_urls[cat_name]
    file = URI.open(url)
    cat.photo.attach(io: file, filename: "cat_image.jpg", content_type: "image/jpg")
    cat.save!

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
  # rand(1..3).times do
  #   dat = Faker::Date.between(from: Date.new(2000, 1, 1), to: Date.today)
  #   Reservation.create({
  #     starting_date: dat,
  #     ending_date: dat,
  #     # user: user,
  #     # cat: cat
  #   })
  # end
end
puts 'Done'
