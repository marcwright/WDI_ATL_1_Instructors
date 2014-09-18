# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Venue.create([
  {name: '930 Club', city: 'Washington', state: 'DC', allows_profanity: true},
  {name: 'Merriweather Post Pavilion', city: 'Columbia', state: 'MD', allows_profanity: false}
  ])

Band.create([
  {name: 'Red Hot Chili Peppers', genre: 'alternative rock', explicit: true, video_url: 'http://www.youtube.com/embed/1TiIgm0xY0A'},
  {name: 'The Shins', genre: 'indie rock', explicit: true, video_url: 'http://www.youtube.com/embed/RoLTPcD1S4Q'}
  ])


