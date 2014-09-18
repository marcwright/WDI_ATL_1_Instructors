# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Dog.delete_all

Dog.create(name: "Fifi", age: 3, image_url: "http://www.dogbreedinfo.com/images14/PoodleMiniPeanutpuppypeanut9wks905008.JPG")

Dog.create(name: "Sparky", age: 1, image_url: "http://cdn-www.dailypuppy.com/dog-images/chewie-the-pembroke-welsh-corgi_56141_2011-03-03_w450.jpg")

Dog.create(name: "Snowball", age: 1, image_url: "http://cdn-www.dailypuppy.com/dog-images/toro-the-american-eskimo-2_65743_2012-05-06_w450.jpg")
