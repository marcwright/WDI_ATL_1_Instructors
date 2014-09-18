class Round < ActiveRecord::Base
  belongs_to :episode
  has_many :dish
end
