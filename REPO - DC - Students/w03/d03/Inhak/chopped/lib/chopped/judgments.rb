class Judgment < ActiveRecord::Base
  belongs_to :judge
  belongs_to :episode

  validates_associated :judge, :episode
end
