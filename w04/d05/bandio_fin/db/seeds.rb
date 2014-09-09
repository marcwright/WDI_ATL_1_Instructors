# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


Venue.create(name: "The Metro", city: "Chicago", state: "IL", allows_explicit_lyrics: true)
Venue.create(name: "Black Cat", city: "Washington", state: "District of Columbia", allows_explicit_lyrics: true)
Venue.create(name: "The Roundhouse", city: "Salt Lake City", state: "UT", allows_explicit_lyrics: false)
Venue.create(name: "Marcus Amphitheater", city: "Milwaukee", state: "WI", allows_explicit_lyrics: true)

Band.create(name: "Paul Simon", genre: "Pure Awesome", explicit_lyrics: false, video_embed_url: "Z6VrKro8djw")
Band.create(name: "Build to Spill", genre: "Indie", explicit_lyrics: false, video_embed_url: "k0JiLCkN9_0")
Band.create(name: "Kanye West", genre: "Hip-Hop", explicit_lyrics: true, video_embed_url: "BBAtAM7vtgc")
Band.create(name: "Led Zeppelin", genre: "Pure Awesome", explicit_lyrics: false, video_embed_url: "UNVRIPgfRNE")
Band.create(name: "Eminem", genre: "Hip-Hop", explicit_lyrics: true, video_embed_url: "wsYUkmVVfYs")
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
