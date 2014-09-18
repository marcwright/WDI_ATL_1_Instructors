
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Event.create(name: "Sweetlife Festival", date: "04/04/2014", time: "24:00", venue_id: 1, band_id: 2)
Event.create(name: "Union BBQ", date: "04/04/2014", time: "20:00", venue_id: 2, band_id: 1)
