# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Dog.delete_all

Dog.create(name: "Fifi", age: 10, image_url: "http://cdn.superbwallpapers.com/wallpapers/animals/poodle-puppy-5719-1920x1200.jpg")
Dog.create(name: "Sparky", age: 1, image_url: "https://pbs.twimg.com/profile_images/378800000822867536/3f5a00acf72df93528b6bb7cd0a4fd0c.jpeg")
Dog.create(name: "Tim", age: 5, image_url: "http://www.assisianimalhealth.com/news/wp-content/uploads/2013/01/dachshund-back-problems.jpg")
