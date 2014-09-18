class CreateIngredientsRecipesTable < ActiveRecord::Migration
  def change
    create_table :ingredients_recipes, id: false do |t|
      t.references :ingredient
      t.references :recipe
    end
  end
end
