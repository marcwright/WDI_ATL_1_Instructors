class Dish < ActiveRecord::Base
  belongs_to :round
  belongs_to :chef
  has_many :scores
  has_many :judges, :through => :scores
  validates_presence_of :title
  validates_numericality_of :chef_id, only_integer: true
  validates_numericality_of :round_id, only_integer: true
end
