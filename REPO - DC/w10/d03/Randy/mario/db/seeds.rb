# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Character.create([
  {name: 'Luigi', img_url: "http://i0.kym-cdn.com/photos/images/newsfeed/000/768/954/f41.jpg", coins: 9000},
  {name: 'Toad', img_url: "http://static.giantbomb.com/uploads/original/9/95666/1907632-new_super_mario_bros._wii_toad.png", coins: 6}
  ])
