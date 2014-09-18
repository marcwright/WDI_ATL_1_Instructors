# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all
Ingredient.delete_all
Recipe.delete_all

c1 = Category.create!(name: 'starters')
c2 = Category.create!(name: 'dessert')
c3 = Category.create!(name: 'mains')

i1 = Ingredient.create!(name: 'Eggs')
i2 = Ingredient.create!(name: 'Salt')
i3 = Ingredient.create!(name: 'Flour')
i4 = Ingredient.create!(name: 'Pepper')
i5 = Ingredient.create!(name: 'Onion')
i6 = Ingredient.create!(name: 'Cheese')

Recipe.create!(name: 'Scrambled eggs')
Recipe.create!(name: 'Batter mix')
Recipe.create!(name: 'Cheesy peppered onions')

