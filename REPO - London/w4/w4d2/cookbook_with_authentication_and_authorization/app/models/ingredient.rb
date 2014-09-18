class Ingredient < ActiveRecord::Base
  attr_accessible :name, :image

  has_many :ingredients_recipes
  has_many :recipes, through: :ingredients_recipes

  validates :name, presence: true

end
