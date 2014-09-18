class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many :rounds
  validates_presence_of :name
  validates_length_of :name, minimum: 3
  validates_uniqueness_of :name
end
