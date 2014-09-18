class Recipe < ActiveRecord::Base
  attr_accessible :description, :instructions, :name, :category_id, :ingredients_recipes_attributes, :tag_list

  acts_as_taggable_on :tags

  belongs_to :category

  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes
  

  accepts_nested_attributes_for :ingredients_recipes, allow_destroy: true


  validates :name, presence: true
  validates :name, length: {in: 2..20}
  validate :validate_at_least_one_ingredient
 
  private
  def validate_at_least_one_ingredient
    errors.add(:base, 'needs at least one ingredient') unless ingredients_recipes.size > 0
  end



end
