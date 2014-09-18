# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[Band, Venue, Event].each do |model|
  model.delete_all
  model.connection.reset_pk_sequence!(model.table_name)
end

# create venues
nine_thirty_club = Venue.create(
  name: "9:30 Club",
  city: "Washington",
  state: "DC",
  allows_explicit_lyrics: true
)

wolf_trap = Venue.create(
  name: "Wolf Trap",
  city: "Vienna",
  state: "VA",
  allows_explicit_lyrics: false
)

# create bands
green_day = Band.create(
  name: "Green Day",
  genre: "Punk rock",
  has_explicit_lyrics: true
)

jonas_brothers = Band.create(
  name: "Jonas Brothers",
  genre: "Pop rock",
  has_explicit_lyrics: false
)

# create events
jonas_brothers.events.create(date_time: "2014-06-18 14:00:00", venue: wolf_trap)
green_day.events.create(date_time: "2014-06-17 22:00:00", venue: nine_thirty_club)
