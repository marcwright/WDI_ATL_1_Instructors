# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Entry.delete_all

Entry.create(author: "Kim Jong Un", photo_url: "http://www.clearpathtofitness.com/wp-content/uploads/2012/03/uglymichaelmoore-300x222.jpg", date_taken: "01/03/2010")
Entry.create(author: "Jane Goodall", photo_url: "http://www.clearpathtofitness.com/wp-content/uploads/2012/03/post-1-128698713677-300x200.jpg", date_taken: "28/11/2001")
