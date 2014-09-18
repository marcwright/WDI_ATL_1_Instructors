class Recipe < ActiveRecord::Base
  attr_accessible :name, :instructions, :category_id, :description, :ingredients_recipes_attributes

  belongs_to :category

  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes

  validates :name, presence: true
  validate :validate_at_least_one_ingredient

  accepts_nested_attributes_for :ingredients_recipes, allow_destroy: true

  private
  def validate_at_least_one_ingredient
    errors.add(:base, 'needs at least one ingredient') unless ingredients_recipes.size > 0
  end

end
