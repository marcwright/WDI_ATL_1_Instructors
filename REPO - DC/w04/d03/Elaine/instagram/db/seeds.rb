# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Entry.delete_all

Entry.create(author: "Kitty", photo_url: "http://hrkarts.com/wp-content/uploads/2014/04/Hello-Kitty-69.png", date_taken: 20140101)

Entry.create(author: "Snoopy", photo_url: "http://img2.wikia.nocookie.net/__cb20110331075248/peanuts/images/6/62/Snoopy.gif", date_taken: 20131101)
