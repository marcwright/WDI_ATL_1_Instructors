class Score < ActiveRecord::Base
  belongs_to :dish
  belongs_to :judge

  validates_presence_of :value
  validates_numericality_of :value, only_integer: true
end
