class IngredientsRecipe < ActiveRecord::Base
  attr_accessible :ingredient_id, :recipe_id, :ingredient_attributes

  belongs_to :recipe
  belongs_to :ingredient
  attr_accessible :quantity

  accepts_nested_attributes_for :ingredient
end
