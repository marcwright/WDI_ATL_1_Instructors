class Dish < ActiveRecord::Base
  has_many :score
  belongs_to :round
  belongs_to :chef
end
