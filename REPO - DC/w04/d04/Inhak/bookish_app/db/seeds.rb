# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Author.delete_all
Author.create(name: "Ayn Rand", dob: "1905-02-02", gender: "female")
Author.create(name: "J.K. Rowling", dob: "1965-07-31", gender: "female")
