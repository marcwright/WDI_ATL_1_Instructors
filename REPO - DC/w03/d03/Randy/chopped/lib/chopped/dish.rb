class Dish < ActiveRecord::Base
  has_many :scores

  belongs_to :round, foreign_key: 'round_id'
  belongs_to :chef, foreign_key: 'chef_id'

  has_many :judges, through: :scores

  validates_presence_of :dish_name

  validates_numericality_of :round_id, only_integer: true
  validates_numericality_of :chef_id, only_integer: true
end
