# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all
    Recipe.delete_all
      Ingredient.delete_all
 
    categories = Category.create([
      { name: 'Breakfast' },
      { name: 'Lunch' },
      { name: 'Dinner'}
    ])

    ingredients = Ingredient.create([
      { name: 'Bacon' },
      { name: 'Pasta' },
      { name: 'Butter'},
      { name: 'Salt'}
    ])
 
    recipes = Recipe.create([
      { name: 'Bacon and eggs', description: 'A mighty breakfast', instructions: 'Fry eggs in oil. Grill bacon.  Eat together on a plate.' },
      { name: 'Buttery pasta', description: 'A cheap dinner', instructions: 'Cook pasta, drain and serve with salt and butter.'},
      { name: 'Beans on toast', description: 'A hearty lunch', instructions: 'Cook beans in pan.  Toast bread.  Pour beans on bread.'}
    ])