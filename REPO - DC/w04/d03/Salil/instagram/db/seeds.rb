# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Entry.delete_all

Entry.create(author: "Salil Doshi", photo_url: "http://i.imgur.com/2FVoc7A.jpg", date_taken: "2014-04-28")
Entry.create(author: "Salil Doshi", photo_url: "http://i.imgur.com/UFCo68R.jpg", date_taken: "2014-04-11")
