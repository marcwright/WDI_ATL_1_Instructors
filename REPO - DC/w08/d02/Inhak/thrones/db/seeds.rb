# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

richard = Character.create(name: "Richard Hessler", is_dead: false)
peter = Character.create(name: "Peter Y. Lai", is_dead: false)
arya = Character.create(name: "Arya Stark", is_dead: false)
joffre = Character.create(name: "Joffre Baratheon", is_dead: true)
tyrion = Character.create(name: "Tyrion Lannister", is_dead: false)
