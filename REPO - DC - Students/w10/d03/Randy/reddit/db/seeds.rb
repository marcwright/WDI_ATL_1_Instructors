# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Link.create([
  {title: "XKCD LOL", url:'http://www.xkcd.com', votes: 912 },
  {title: "TIL a fact everyone knew already", url: "http://www.theguardian.com/notesandqueries/query/0,5753,-1725,00.html", votes: 6},
  {title: 'Chocolate Cake', url: "http://eatapieceofcake.blogspot.com/2014/06/nutella-chocolate-cake.html", votes: 234}
  ])
