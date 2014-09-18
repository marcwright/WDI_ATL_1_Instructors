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
IngredientsRecipe.delete_all

c1 = Category.create!(name: 'starters')
c2 = Category.create!(name: 'dessert')
c3 = Category.create!(name: 'mains')

i1 = Ingredient.create!(name: 'Eggs')
i2 = Ingredient.create!(name: 'Salt')
i3 = Ingredient.create!(name: 'Flour')
i4 = Ingredient.create!(name: 'Pepper')
i5 = Ingredient.create!(name: 'Onion')
i6 = Ingredient.create!(name: 'Cheese')

r1 = Recipe.new(name: 'Scrambled eggs')
r1.ingredients_recipes << IngredientsRecipe.new(ingredient_id: i1.id, quantity: '1 half')
r1.ingredients_recipes << IngredientsRecipe.new(ingredient_id: i2.id, quantity: '2 lumps')
r1.save!

r2 = Recipe.new(name: 'Batter mix')
r2.ingredients_recipes << IngredientsRecipe.new(ingredient_id: i2.id, quantity: 'half square')
r2.ingredients_recipes << IngredientsRecipe.new(ingredient_id: i1.id, quantity: '.5 hundred weight')
r2.ingredients_recipes << IngredientsRecipe.new(ingredient_id: i3.id, quantity: 'a bushel')
r2.save!

r3 = Recipe.new(name: 'Cheesy peppered onions')
r3.ingredients_recipes << IngredientsRecipe.new(ingredient_id: i6.id, quantity: 'a peck')
r3.ingredients_recipes << IngredientsRecipe.new(ingredient_id: i4.id, quantity: '7 nibbles')
r3.ingredients_recipes << IngredientsRecipe.new(ingredient_id: i5.id, quantity: '12 grams')
r3.save!

