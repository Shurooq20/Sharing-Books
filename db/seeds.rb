# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
Book.destroy_all

    50.times do 
        Category.create({
                name: Faker::Hacker.say_something_smart,
                img_url: Faker::LoremPixel.image(size: "730x411"),  
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
        
        )
    end

puts Cowsay.say("Generated #{Category.count} Categories", :frogs)
puts Cowsay.say("Generated #{Book.count} Books", :cow)