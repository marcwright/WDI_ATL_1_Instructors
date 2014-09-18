# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# =>
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Venue.create(name: "Black Cat", city: "Washington", state: "DC", allows_explicit_lyrics: true)
Venue.create(name: "Uncle Larry's Basement", city: "Washington", state:"DC", allows_explicit_lyrics: true)
Venue.create(name: "Lincoln Theater", city: "Washington", state: "DC", allows_explicit_lyrics: false)
Venue.create(name: "DC9", city: "Washington", state: "DC", allows_explicit_lyrics: true)

Band.create(name: 'Meat Fumble', genre: 'Soft Rock', explicit_lyrics: true)
Band.create(name: 'Dark Rocket', genre: 'Religious', explicit_lyrics: false)
Band.create(name: 'Wad', genre: 'Post Rock', explicit_lyrics: false)
Band.create(name: 'Jamcake', genre: 'child rock', explicit_lyrics: false)

Event.create(date: '2014-05-20', time: "8:00")
Event.create(date: '2014-05-25', time: "9:00")
Event.create(date: '2014-05-30', time: "9:00")
Event.create(date: '2014-06-05', time: "9:00")
