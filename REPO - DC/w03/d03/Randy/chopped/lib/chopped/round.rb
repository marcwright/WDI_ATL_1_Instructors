class Round < ActiveRecord::Base
  has_many :dishes
  belongs_to :episode, foreign_key: 'episode_id'
  has_many :scores, through: :dishes
  validates_numericality_of :round_num, only_integer: true

  validates_numericality_of :episode_id, only_integer: true
end
