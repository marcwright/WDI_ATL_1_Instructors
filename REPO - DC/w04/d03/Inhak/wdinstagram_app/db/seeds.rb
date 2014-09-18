# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Entry.delete_all

Entry.create(author: "RichardHess", photo_url: "https://fbcdn-sphotos-b-a.akamaihd.net/hphotos-ak-frc1/t1.0-9/400633_10102542453973701_1929274234_n.jpg", date: Time.now)
Entry.create(author: "George Clooney", photo_url: "http://heightnbra.com/wp-content/uploads/2014/02/George-Clooney-Height.jpg", date: Time.now)
Entry.create(author: "Inukki", photo_url:"http://i.imgur.com/ndy3HU5.jpg", date: Time.now)
