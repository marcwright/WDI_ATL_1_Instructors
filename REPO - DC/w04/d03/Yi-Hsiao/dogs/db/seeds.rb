# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
[Dog, Toy].each do |model|
  model.destroy_all
  ActiveRecord::Base.connection.reset_pk_sequence!(model.table_name)
end

max_dog = Dog.create(name: "Max", age: 1, image: "max.jpg")
max_dog.toys.create(name: "Marvin the Moose", photo_url: "http://ecx.images-amazon.com/images/I/51Npw9iELqL.jpg")
Dog.create(name: "Bella", age: 1, image: "bella.jpg")