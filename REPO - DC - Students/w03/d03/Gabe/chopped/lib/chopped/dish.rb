class Dish < ActiveRecord::Base
  validates_presence_of :description
  validates_presence_of :which_chef
  belongs_to :chef
  has_many :scores
  has_many :judges, through: :scores
end
