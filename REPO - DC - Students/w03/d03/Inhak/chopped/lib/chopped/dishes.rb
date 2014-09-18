class Dish <ActiveRecord::Base
  belongs_to :chef
  belongs_to :round
  has_many :scores

  validates_presence_of :name
  validates_associated :chef, :round, :scores
end
