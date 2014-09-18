# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Entry.create(author: "Inhak Kim", date_taken: Time.now, photo_url: "https://scontent-a-ord.xx.fbcdn.net/hphotos-prn2/t31.0-8/1275828_2646140563903_1889650191_o.jpg")
Entry.create(author: "Mikael Davis", date_taken: Time.now, photo_url: "https://scontent-b-ord.xx.fbcdn.net/hphotos-ash3/t1.0-9/17428_10101711575351121_1314804606_n.jpg")
Entry.create(author: "Richard Hessler", date_taken: Time.now, photo_url: "https://fbcdn-sphotos-b-a.akamaihd.net/hphotos-ak-frc1/t1.0-9/400633_10102542453973701_1929274234_n.jpg")
