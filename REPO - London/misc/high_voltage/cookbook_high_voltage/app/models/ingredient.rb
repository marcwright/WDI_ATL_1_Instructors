class Ingredient < ActiveRecord::Base
  attr_accessible :name

  has_many :ingredients_recipes
  has_many :recipes, :through => :ingredients_recipes

  validates :name, presence: true
  

  def cost
    20
    # @cost ||=(rand*100).round(2)
  end

end
