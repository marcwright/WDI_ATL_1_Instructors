# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p "Destroyed all characters"
Character.destroy_all

# Arya's hit list
p "Adding Arya's hit list"
Character.create([
  { name: "King Joffrey", dead: true },
  { name: "Ser Amory", dead: true },
  { name: "The Tickler", dead: true },
  { name: "Polliver", dead: true },
  { name: "Ser Gregor", dead: true },
  { name: "Raff the Sweetling", dead: true },
  { name: "Chiswyck", dead: true },
  { name: "Weese", dead: true },
  { name: "Ilyn Payne" },
  { name: "Meryn Trant" },
  { name: "Queen Cersei" },
  { name: "Dunsen" },
  { name: "The Hound" }
])

p "Finished seeding"