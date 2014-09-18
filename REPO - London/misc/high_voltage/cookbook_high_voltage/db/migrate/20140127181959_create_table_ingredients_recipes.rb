class CreateTableIngredientsRecipes < ActiveRecord::Migration
  def change
    create_table :ingredients_recipes do |t|
      t.integer :ingredient_id
      t.integer :recipe_id
      t.string :quantity
    end
  
  end
end
