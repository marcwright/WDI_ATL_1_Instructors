class Round < ActiveRecord::Base
  has_many :dishes
  has_and_belongs_to_many :ingredients
  validates_presence_of :episode_no, :round
  validates_numericality_of :episode_no, only_integer: true, greater_than: 0
  validates_inclusion_of :round, :in => %w(appetizer entree dessert)
  validates :food_type, presence: true, length: { minimum: 2, maximum: 20 }

  has_many :scores
end
