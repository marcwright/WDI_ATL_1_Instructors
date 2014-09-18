# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Entry.delete_all
Entry.create(author: "Inhak Kim", photo_url: "http://i2.cdn.turner.com/cnn/dam/assets/130530161523-100-beaches-crane-beach-horizontal-gallery.jpg", date_taken: "04/01/2014")
Entry.create(author: "Mikael Davis", date_taken: "05/12/2014", photo_url: "http://globalgenes.org/wp-content/uploads/2012/03/capitol_hill_washington_DC_lobbying.jpg")
Entry.create(author: "Jon Eva", date_taken: "06/09/2011", photo_url: "http://cdn.oxwordsblog.wpfuel.co.uk/wpcms/wp-content/uploads/apple-e1382039006457.jpg")
