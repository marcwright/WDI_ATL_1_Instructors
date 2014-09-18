# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

songs = Song.create([{
  title: "Wannabe",
  artist: "Spice Girls",
  preview_url: "http://a1201.phobos.apple.com/us/r30/Music/v4/e5/dc/bc/e5dcbc22-400b-b33d-b363-c2461df02835/mzaf_6677547217372264251.plus.aac.p.m4a"
  },{
  title: "MMMBop",
  artist: "Hanson",
  preview_url: "http://a455.phobos.apple.com/us/r1000/065/Music/b5/97/8a/mzm.aegciztp.aac.p.m4a"
  }, {
  title: "Semi-charmed Life",
  artist: "Third Eye Blind",
  preview_url: "http://a1732.phobos.apple.com/us/r1000/093/Music/26/dd/91/mzm.vphhmbiw.aac.p.m4a"
  }])
