# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Entry.create(author: "Gabe", photo_url: "http://2.bp.blogspot.com/_9FmuFIOX1ak/S-ni6HYymmI/AAAAAAAAANg/t7hVNTgHpug/s1600/IMG_6197.jpg", date_taken: Time.now)

Entry.create(author: "Gondo", photo_url: "http://cdn4.sportngin.com/attachments/photo/1788/5773/iStock_000006213630Medium_woodchuck.jpg", date_taken: Time.now)
