# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Book.create(author_id: 1, title: "Harry Potter and the Deathly Hallows", release_date: "2007-07-21", genre: "Fiction")
Book.create(author_id: 3, title: "The Fountainhead", release_date: "1943-04-15", genre: "Fiction")
Book.create(author_id: 4, title: "A Storm of Swords", release_date: "2000-08-08", genre: "Fantasy")
