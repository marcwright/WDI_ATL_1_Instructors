# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Venue.create([
  { name: '930 Club', city: 'Washington', state: 'DC', allows_explicit_lyrics: true },
  { name: 'Merriweather Post Pavilion', city: 'Columbia', state: 'MD', allows_explicit_lyrics: false }
  ])

Band.create([
  { name: 'Tame Impala', genre: 'psychelidc', explicit_lyrics: false, video_embed_url: 'http://www.youtube.com/embed/b0jqPvpn3sY' },
  { name: 'Arcade Fire', genre: 'alternative', explicit_lyrics: true, video_embed_url: 'http://www.youtube.com/embed/hRXc_-c_9Xc'}
  ])
