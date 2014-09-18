class Score < ActiveRecord::Base
  belongs_to :judge, foreign_key: 'judge_id'
  belongs_to :dish, foreign_key: 'dish_id'

  validates_numericality_of :score_value, only_integer: true
  validates_numericality_of :judge_id, only_integer: true
  validates_numericality_of :dish_id, only_integer: true
end
