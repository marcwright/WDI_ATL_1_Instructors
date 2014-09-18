# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Entry.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!("entries")
Entry.create(author: "Peter", photo_url: "1.jpg", date_taken: "2014-05-12", caption: "Startup life. #middayslump #dogsofig #vscocam")
Entry.create(author: "Travis", photo_url: "2.jpg", date_taken: "2014-05-13", caption: "Great turnout for our first class in Seattle last night. Thanks for coming out!")
Entry.create(author: "Greg", photo_url: "3.jpg", date_taken: "2014-05-14", caption: "Best #selfie yet? Students at our NYC campus.")