# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Dog.delete_all

Dog.create(name: "Fifi", age: 10, image_url: "http://meetmeattheoffice.com/wp-content/uploads/2012/12/Poodle-Sales-Pup.jpg")
Dog.create(name: "Sparky", age: 1, image_url: "http://f00.inventorspot.com/images/8-_Baby_Frog.jpg")
