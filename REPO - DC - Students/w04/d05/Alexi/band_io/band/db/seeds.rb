# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Venue.create([
  {name: '930 Club', city: 'Washington', state: 'DC', allows_explicit_lyrics: true}, {name: 'DC9', city: 'Washington', state: 'DC', allows_explicit_lyrics: true}
  ])

Band.create([
  {name: 'Arcade Fire', genre: 'Indie', explicit_lyrics: true, video_url: "http://youtu.be/7E0fVfectDo"}, {name: "Blouse", genre: "Indie", explicit_lyrics: true, video_url: "http://www.youtube.com/watch?v=IbYgGNDGcpY"}, {name: "Dum Dum Girls" , genre: "Indie", explicit_lyrics: true, video_url: "http://www.youtube.com/watch?v=YBSs3-RfLKk"}, {name: "Grimes", genre: "Indie", explicit_lyrics: true, video_url: "http://www.youtube.com/watch?v=JtH68PJIQLE"}
  ])
