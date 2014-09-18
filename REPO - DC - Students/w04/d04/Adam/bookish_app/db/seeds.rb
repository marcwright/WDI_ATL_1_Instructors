# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Author.create(name: 'Adam', birth: '10/28/1987', gender: 'M', has_pseudonym: 'turtleman')
Book.create(title: 'Go run far far away')
Character.create(name: 'Booper', gender: 'M', quirk: 'What is this?')
