# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Author.create(name: "Mark Twain", dob: "1835-11-30", gender: "Male", has_pseudonym: true)
Author.create(name: "Dr. Seuss", dob: "1904-03-02", gender: "Male", has_pseudonym: true)
Author.create(name: "Kurt Vonnegut", dob: "1922-11-11", gender: "Male", has_pseudonym: false)
