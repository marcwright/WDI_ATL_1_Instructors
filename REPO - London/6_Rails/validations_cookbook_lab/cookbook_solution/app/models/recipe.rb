class Recipe < ActiveRecord::Base
  attr_accessible :name, :instructions, :category_id, :description, :vegetarian

  belongs_to :category

  validates :description, length: { in: 30..400 }
  validates :name, uniqueness: true 
  validates :name, format: {with: /\A[a-zA-Z]+\z/, message: " can only contains letters"}
  validates :category_id, presence: true, on: :update
end
