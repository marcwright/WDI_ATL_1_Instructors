class Round < ActiveRecord::Base
  has_many :dishes
  has_many :chefs, :through => :dishes

  validates_presence_of :name
  validates_inclusion_of :name, in: %w(appetizer entree dessert)
end
