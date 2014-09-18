Ingredient.delete_all
Recipe.delete_all
IngredientsRecipe.delete_all

salt = Ingredient.create! name: 'Salt'
pepper = Ingredient.create! name: 'Pepper'
milk = Ingredient.create! name: 'Milk'
olive_oil = Ingredient.create! name: 'Olive oil'
egg = Ingredient.create! name: 'Egg'
water = Ingredient.create! name: 'Water'
butter = Ingredient.create! name: 'Butter'

r = Recipe.create! name: 'Scrambled Eggs', ingredient_ids: [egg.id, salt.id, milk.id, butter.id]
r = Recipe.create! name: 'Omlette', ingredient_ids: [egg.id, milk.id, salt.id]


