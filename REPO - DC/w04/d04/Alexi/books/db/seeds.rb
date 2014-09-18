# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Author.create(name: 'JK Rowling', birth: '01/01/1965', gender: 'female')
Book.create(title: 'Harry Potter and the Sorcerer\'s Stone', date: '2000', genre: 'fantasy', author_id: 4)
