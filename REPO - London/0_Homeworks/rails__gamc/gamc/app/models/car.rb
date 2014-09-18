class Car < ActiveRecord::Base
  attr_accessible :brand, :colour, :image, :max_speed, :name, :released_year

  validates :name, presence: true
  validates :max_speed, numericality: true
end
