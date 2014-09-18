# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

animals = Album.create(title: 'Cute Animals')
lols = Album.create(title: 'Lols')
wut = Album.create(title: 'Wut')
animals.images.create(title: 'Ferret', url: 'http://i.imgur.com/3e2khf9.jpg')
animals.images.create(title: 'Gerbil', url: 'http://i.imgur.com/a1zDQWb.gif')
animals.images.create(title: 'Raccoon', url: 'http://i.imgur.com/bEKHNj1.gif')
animals.images.create(title: 'Pokemon', url: 'http://i.imgur.com/9HBrTit.gif')
wut.images.create(title: 'Leeloo', url: 'http://i.imgur.com/zDJU8Be.jpg')
wut.images.create(title: 'Tongue', url: 'http://i.imgur.com/psIOBE3.gif')
wut.images.create(title: 'Ducks', url: 'http://i.imgur.com/swhxh17.jpg')

