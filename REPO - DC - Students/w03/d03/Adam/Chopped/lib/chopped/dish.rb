class Dish < ActiveRecord::Base
  belongs_to :chef
  belongs_to :round
  has_many :scores
end
