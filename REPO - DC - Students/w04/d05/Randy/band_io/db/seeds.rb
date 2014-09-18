# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Venue.create(name: "Jim's Music Shack", city: "Des Monies", state: "Iowa", allows_explicit_lyrics: false)
Venue.create(name: "Madison Square Garden", city: "New York", state: "New York", allows_explicit_lyrics: false)
Venue.create(name: "Band-o-Rama", city: "Burlington", state: "Vermont", allows_explicit_lyrics: true)

Band.create(name: "Sonic Feedback", genre: "Post-Static", explicit_lyrics: true, video_embed_url: "https://www.youtube.com/watch?v=E8-WHslFhbU")
Band.create(name: "Rancid", genre: "Punk", explicit_lyrics: true, video_embed_url: "https://www.youtube.com/watch?v=DhKHAopx7D0")
Band.create(name: "Streetlight Manifesto", genre: "Ska", explicit_lyrics: true, video_embed_url: "https://www.youtube.com/watch?v=Sk9RRnpFg24")


Event.create(date: "2014-09-21", time: "20:30:00", venue_id: 1, band_id: 1)
Event.create(date: "2014-10-01", time: "18:30:00", venue_id: 2, band_id: 2)
Event.create(date: "2014-08-11", time: "21:40:00", venue_id: 3, band_id: 3)
Event.create(date: "2014-12-24", time: "09:30:00", venue_id: 2, band_id: 1)



