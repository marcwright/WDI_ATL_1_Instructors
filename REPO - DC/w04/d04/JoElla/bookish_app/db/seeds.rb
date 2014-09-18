# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Author.create(name: "Jane Austen", dob: '1775-12-16', gender: "female", has_psuedonym: false)
Author.create(name: "Herman Melville", dob: '1889-08-01', gender: "male", has_psuedonym: false)
Author.create(name: "Dr. Seuss", dob: '1904-03-02', gender: "male", has_psuedonym: true)

