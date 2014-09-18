# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Band.delete_all
Venue.delete_all
Event.delete_all

Band.create(name: "The Police", genre: "80's New Wave", has_explicit_lyrics: false, video_embed_url: "JwnMG5yGJls")
Band.create(name: "Pink Floyd", genre: "Progressive Rock", has_explicit_lyrics: false, video_embed_url: "IkcbqJUGG8Y")
Band.create(name: "Queen", genre: "Rock", has_explicit_lyrics: false, video_embed_url: "")

Venue.create(name: "The Old Grey Whistle Test", city: "London", state: "United Kingdom", allows_explicit_lyrics: false)
Venue.create(name: "Pompeii", city: "Pompeii", state: "Italy", allows_explicit_lyrics: true)
Venue.create(name: "O2 Stadium", city: "London", state: "United Kingdom", allows_explicit_lyrics: true)

Event.create(date: "1988-05-05", time: "20:00:00", venue_id: 1, band_id: 1)
Event.create(date: "1989-07-08", time: "12:00:00", venue_id: 2, band_id: 2)
Event.create(date: "1995-01-18", time: "16:00:00", venue_id: 3, band_id: 3)
