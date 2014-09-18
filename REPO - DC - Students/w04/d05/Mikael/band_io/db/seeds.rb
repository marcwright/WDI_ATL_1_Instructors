# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Venue.create(name: "9:30 Club", city: "Washington", state: "DC", allows_explicit_lyrics: true)
Venue.create(name: "Merriweather Post", city: "Columbia", state: "MD", allows_explicit_lyrics: true)
Venue.create(name: "Wells Fargo Center", city: "Philadelphia", state: "PA", allows_explicit_lyrics: true)

Band.create(name: "The Roots", genre: "Hip-hop", explicit_lyrics: true)
Band.create(name: "Paramore", genre: "Alternative rock", explicit_lyrics: false)
Band.create(name: "The Strokes", genre: "Indie rock", explicit_lyrics: true)

