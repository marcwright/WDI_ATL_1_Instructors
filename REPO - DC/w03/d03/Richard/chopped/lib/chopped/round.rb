class Round < ActiveRecord::Base
  belongs_to :episode
  has_many :dishes


  validates_numericality_of :round_no, only_integer: true
  validates_numericality_of :time_limit, only_integer: true
end
