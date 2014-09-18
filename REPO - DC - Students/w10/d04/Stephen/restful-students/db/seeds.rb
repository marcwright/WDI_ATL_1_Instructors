# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Student.create([
  { name: 'Stephen', email: 'stephen@stanwoodsolutions.com', phone: '217.372.1368', location: 'Washington, DC', employment: 'student' },

  { name: 'Marp', email: 'marp@darp.com', phone: '1.888.MARPDARP', location: 'Marp, DARP', employment: 'larping' },

  { name: 'Matt', email: 'mddcat04@gmail.com', phone: '724.612.5000', location: 'Los Gatos, CA', employment: 'teacher' }
])
