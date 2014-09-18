# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Entry.create(author: "Tina Fey", photo_url: "http://www.lifenews.com/wp-content/uploads/2013/10/tinafey.jpg", date_taken: Time.now)
Entry.create(author: "Kristen Wiig", photo_url: "http://img2.timeinc.net/instyle/images/2012/TRANSFORMATIONS/021512-kristen-wiig-2007-400.jpg" , date_taken: Time.now)

Entry.create(author: "Julia Louis-Dreyfus", photo_url: "http://www.baltimoresun.com/media/photo/2011-10/23456439578720-03135200.jpg" , date_taken: Time.now)
