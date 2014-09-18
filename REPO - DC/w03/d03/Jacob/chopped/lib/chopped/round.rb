class Round < ActiveRecord::Base
  belongs_to :episode
  has_many :dishes
  has_many :chefs, :through => :dishes

  validates_presence_of :theme
  validates_numericality_of :episode_id, only_integer: true
  validates_numericality_of :round_number, greater_than_or_equal_to: 1
  validates_numericality_of :round_number, less_than: 4
end
