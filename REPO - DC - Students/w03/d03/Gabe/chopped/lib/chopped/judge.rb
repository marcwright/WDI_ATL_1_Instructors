class Judge < ActiveRecord::Base
  validates_presence_of :judge_name
  belongs_to :round
  has_many :scores
  has_many :dishes, through: :scores
end
