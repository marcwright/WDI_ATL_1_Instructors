# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Person.create(:name => "Hannah",
              :age => 36,
              height_in_inches: 66,
              eye_color: "blue",
              hair_color: "red")
Person.create(:name => "Jen",
              :age => 29,
              height_in_inches: 58,
              eye_color: "brown",
              hair_color: "brown")
Person.create(:name => "Meredith",
              :age => 26,
              height_in_inches: 62,
              eye_color: "green",
              hair_color: "blond")
Person.create(:name => "Lorin",
              :age => 44,
              height_in_inches: 72,
              eye_color: "brown",
              hair_color: "brown")