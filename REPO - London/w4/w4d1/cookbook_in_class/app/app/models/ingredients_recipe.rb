class IngredientsRecipe < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :recipe

  attr_accessible :quantity

end
