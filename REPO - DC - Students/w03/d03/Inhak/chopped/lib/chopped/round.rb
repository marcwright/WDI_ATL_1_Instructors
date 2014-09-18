class Round < ActiveRecord::Base
  has_many :dishes
  belongs_to :episode

  validates_presence_of :time_limit, :round_num
  validates_associated :dishes, :episode
end
