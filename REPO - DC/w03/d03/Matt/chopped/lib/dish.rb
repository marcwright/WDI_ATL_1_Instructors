require_relative: "chopped"

class Dish < ActiveRecord::Base
  has_many :scores
  belongs_to :chef
end
