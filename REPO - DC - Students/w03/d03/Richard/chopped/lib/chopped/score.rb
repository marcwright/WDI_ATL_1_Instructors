class Score < ActiveRecord::Base
  belongs_to :dish
  belongs_to :judge

  validates_presence_of :score
end
