class Ingredient < ActiveRecord::Base
  attr_accessible :name, :image, :price, :gluten_free

  validates :image, presence: true, format: {with: /^http|https/i, message: "has to begin with http or https"}
  validates :name, uniqueness: true
  validates :price, numericality: true
end
