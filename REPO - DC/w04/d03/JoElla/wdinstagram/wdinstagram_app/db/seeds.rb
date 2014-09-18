# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Entry.create(author: "Gilbert", photo_url: "http://www.tehcute.com/pics/201109/is-this-a-kitten-or-a-puppy--big.jpg", date_taken: Time.now)
Entry.create(author: "Sam", photo_url: "http://cdn.cutestpaw.com/wp-content/uploads/2011/11/A-FIST-FULL-OF-PUPPY-l.jpg", date_taken: Time.now)
Entry.create(author: "Gus", photo_url: "http://fc01.deviantart.net/fs71/f/2012/294/5/0/one_of_our_chihuahua_puppies_by_wolfje16-d5igiwj.jpg", date_taken: Time.now)


