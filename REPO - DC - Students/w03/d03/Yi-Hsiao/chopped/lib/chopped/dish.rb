class Dish < ActiveRecord::Base
  belongs_to :chef
  belongs_to :round
  validates_presence_of :name, :chopped
  validates_length_of :name, minimum: 3
  validates_inclusion_of :chopped, :in => [true, false]
end
