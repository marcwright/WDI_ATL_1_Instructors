class Dish < ActiveRecord::Base
  belongs_to :round
  belongs_to :chef
  has_many :scores

  validates_presence_of :name
end
