# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
Book.destroy_all
User.delete_all

NUM_USER = 10
PASSWORD = 'shurooq20'

super_user = User.create(
    first_name: 'jon',
    last_name: 'snow',
    email: 'js@winterfell.gov',
    password: PASSWORD
)

NUM_USER.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
        first_name: first_name,
        last_name: last_name,
        email: Faker::Internet.email,
        password: PASSWORD
    )
end

users = User.all 

    50.times do 
        Category.create({
                name: Faker::Hacker.say_something_smart,
                img_url: Faker::LoremPixel.image(size: "730x411"), 
                user: users.sample, 
        })
    end

    category = Category.all
    50.times do
    
        Book.create(
            category: category.sample,
            title: "#{Faker::Cannabis.strain}-#{rand(1_000_000_000)}",
            author: Faker::Games::SuperSmashBros.fighter,
            link: "https://stackoverflow.com/questions/17746583/how-to-generate-fake-book-names",
            description: Faker::Hipster.paragraph,
            img2_url: Faker::LoremPixel.image(size: "730x411"),
            rating: rand(1..5),
            user: users.sample,
        
        )
    end

puts Cowsay.say("Generated #{Category.count} Categories", :frogs)
puts Cowsay.say("Generated #{Book.count} Books", :cow)
puts Cowsay.say("Created #{users.count}  users", :dragon)