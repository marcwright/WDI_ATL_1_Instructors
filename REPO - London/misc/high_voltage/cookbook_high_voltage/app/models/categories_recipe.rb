class CategoriesRecipe < ActiveRecord::Base
  attr_accessible :category_id, :recipe_id

  belongs_to :categories
  belongs_to :recipes
end
