# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Dog.delete_all

Dog.create(name: "Fifi", age: 2, image_url: "http://www.tehcute.com/pics/201109/is-this-a-kitten-or-a-puppy--big.jpg")
Dog.create(name: "Sparky", age: 1, image_url: "http://pspwallpapersfree.com/wp-content/uploads/2014/04/puppyhusky-puppy-18220-1920x1200jpg-free-quality-wallpapers-full-hd-3khuwno5.jpg")
