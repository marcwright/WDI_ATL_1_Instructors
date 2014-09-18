class Recipe < ActiveRecord::Base
  attr_accessible :image, :name, :ingredient_ids

  has_many :ingredients_recipes, dependent: :destroy
  has_many :ingredients, through: :ingredients_recipes

end
