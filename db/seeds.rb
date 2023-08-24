
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

addresses = [
  "45 Cr d'Alsace-et-Lorraine, 33000 Bordeaux",
  "14 Rue Guiraude, 33000 Bordeaux",
  "7 Quai des Queyries, 33100 Bordeaux",
  "6 Pl. Paul et Jean Paul Avisseau, 33300 Bordeaux",
  "Bd Jacques Chaban-Delmas, 33520 Bruges",
  "64 Rue Malbec, 33800 Bordeaux",
  "71 Bd du Président Wilson, 33200 Bordeaux",
  "16 Rue de Tivoli, 33000 Bordeaux",
  "198 Bd Godard, 33000 Bordeaux",
  "Bassin à Flot n°, 1 Cr Henri Brunet, 33300 Bordeaux",
  "Av. des 40 Journaux, 33300 Bordeaux",
  "Av. de l'Île de France, 33370 Artigues-près-Bordeaux",
  "62 Av. de Branne, 33370 Tresses",
  "180 Rue Raymond Lavigne, 33110 Le Bouscat",
  "87 Quai des Queyries, 33100 Bordeaux",
  "230 Av. du Maréchal de Lattre de Tassigny, 33200 Bordeaux",
  "10B Rue Marcel Sembat, 33100 Bordeaux",
  "2 Cité de la Touratte, 33100 Bordeaux",
  "25 Rue Calve, 33000 Bordeaux",
  "111 Av. Jean Jaurès, 33520 Bruges",
  "50 Rue Gambetta, 33200 Bordeaux"
]

cats_name = cat_image_urls.keys

Faker::Config.locale = 'fr'

5.times do |index|
  if index == 0
    user = User.create({ email: "test@test.test", password: "testtest"})
  else
    user = User.create({ email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8) })
  end
  2.times do
    cat_name = cats_name.sample
    cats_name.delete(cat_name)
    cat = Cat.new({
      name: cat_name,
      gender: ["male", "female"].sample,
      address: addresses.pop,
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
        starting_date: Faker::Date.between(from: Date.new(2000, 1, 1), to: Date.today),
        ending_date: Faker::Date.between(from: dat, to: Date.today),
        user: user,
        cat: cat
      })
    end
  end
end
puts 'Done'
