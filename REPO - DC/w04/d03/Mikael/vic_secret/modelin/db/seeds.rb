# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Model.delete_all
Model.create(name: "Miranda Kerr", age: 31, image_url: "http://www.dailyhiit.com/hiit-blog/wp-content/uploads/2013/08/miranda-kerr-18.jpg")
Model.create(name: "Selita Ebanks", age: 31, image_url: "http://ucesy-sk.happyhair.sk/celebrity_img/ebanks1au710.jpg")
Model.create(name: "Adriana Lima", age: 32, image_url: "http://www.celeb-surgery.com/wp-content/uploads/celeb-photos23/Celebrity-adriana-lima-botox.jpeg")
