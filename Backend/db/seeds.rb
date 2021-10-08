require 'faker'

puts "🌱 Seeding users..."
user1 = User.create(firstName: "Julie", lastName: "Meng", username: "JuMeng", password: "Meng54321", isLoggedIn: false)
user2 = User.create(firstName: "Billy", lastName: "Baney", username: "BillyBan", password: "Bany98765", isLoggedIn: false)
user3 = User.create(firstName: "Paul", lastName: "Ghayad", username: "PaulG", password: "password", isLoggedIn: false)

puts "🌱 Seeding trips..."
trip1 = Trip.create(title: "When in Rome", location: "Rome, Italy", image: "https://iheartitaly.co/wp-content/uploads/2019/10/Rome-Mistakes-Colosseo.jpg", description: "Visting Historic Rome", lengthOfStay: 8, user: user2)
trip2 = Trip.create(title: "For the love of Paris", location: "Paris, France", image: "https://static.toiimg.com/photo/53336957.cms", description: "Enjoying the city of love", lengthOfStay: 7, user: user1)
trip3 = Trip.create(title: "London Trip", location: "London, England", image: "https://images.unsplash.com/photo-1505761671935-60b3a7427bad?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80", description: "Tea time in London", lengthOfStay: 4, user: user3)
trip4 = Trip.create(title: "The trip down-under", location: "Melbourne, Australia", image: "https://www.jacobs.com/sites/default/files/styles/1070xh/public/2019-10/Melbourne_HERO.jpg?itok=DHooW7aC", description: "Visting the down under country", lengthOfStay: 12, user: user2)
trip5 = Trip.create(title: "The Big Apple", location: "New York City, New york", image: "https://res.cloudinary.com/jerrick/image/upload/f_jpg,fl_progressive,q_auto,w_1024/zwkt0dtrpivfbflcf366.jpg", description: "Meeting friends for a fun time!", lengthOfStay: 4, user: user1)


25.times do
    # i = rand(0..17)
    country = Faker::Address.country
    sentence = Faker::Lorem.sentence(word_count: rand(1..6))
    Trip.create(
        title: "#{country} #{sentence}",
        location: country,
        image: Faker::LoremFlickr.image(size: "720x576", search_terms: [country, 'tourism']),
        description: Faker::Lorem.paragraph(sentence_count: rand(5..15)),
        lengthOfStay: rand(1..23),
        user_id: rand(1..3)
    )
end

puts "🌱 Seeding favorites..."
fav1 = Favorite.create(title: "Rome Trip", location: "Rome, Italy", image: "https://iheartitaly.co/wp-content/uploads/2019/10/Rome-Mistakes-Colosseo.jpg", user: user1)
fav2 = Favorite.create(title: "For the love of Paris", location: "Paris, France", image: "https://static.toiimg.com/photo/53336957.cms", user: user2)
fav3 = Favorite.create(title: "London Trip", location: "London, England", image: "https://images.unsplash.com/photo-1505761671935-60b3a7427bad?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80", user: user2)
fav4 = Favorite.create(title: "Down-under Trip", location: "Melbourne, Australia", image: "https://www.jacobs.com/sites/default/files/styles/1070xh/public/2019-10/Melbourne_HERO.jpg?itok=DHooW7aC", user: user1)
fav5 = Favorite.create(title: "The Big Apple", location: "New York City, New york", image: "https://res.cloudinary.com/jerrick/image/upload/f_jpg,fl_progressive,q_auto,w_1024/zwkt0dtrpivfbflcf366.jpg", user: user3)

puts "✅ Done seeding!"
