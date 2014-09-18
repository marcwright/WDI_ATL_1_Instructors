class Judge < ActiveRecord::Base
  has_many :appearances
  has_many :scores

  validates_numericality_of :age, only_integer: true
  validates_presence_of :name
  validates_presence_of :fav_food
end
