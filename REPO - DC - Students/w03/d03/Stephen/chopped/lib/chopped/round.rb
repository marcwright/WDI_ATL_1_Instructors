class Round < ActiveRecord::Base
  validates :food_type, presence: true, length: { minimum: 2, maximum: 20 }

  has_many :scores
end
