class Score < ActiveRecord::Base
  belongs_to :judge
  belongs_to :dish

  validates :score,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 1,
      less_than_or_equal_to: 5
    }
end
