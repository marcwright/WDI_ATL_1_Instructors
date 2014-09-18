class Score < ActiveRecord::Base
  belongs_to :dish
  belongs_to :judge
  validates_numericality_of :numerical_score, greater_than_or_equal_to: 1
  validates_numericality_of :numerical_score, less_than: 6
  validates_numericality_of :dish_id, only_integer: true
  validates_numericality_of :judge_id, only_integer: true
end
