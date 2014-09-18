class Score < ActiveRecord::Base
  belongs_to :dish
  belongs_to :judge

  validates :score,
    numericality: true
  validates :round,
    numericality: true
  validates :judge_id,
    numericality: true
  validates :dish_id,
    numericality: true

end
