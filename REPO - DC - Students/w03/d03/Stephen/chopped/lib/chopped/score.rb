class Score < ActiveRecord::Base
  validates :points, inclusion: { :in => (1..5) }

  belongs_to :chef
  belongs_to :dish
  belongs_to :round
  belongs_to :judge
end
