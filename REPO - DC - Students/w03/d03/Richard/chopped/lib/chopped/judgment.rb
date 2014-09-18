class Judgment < ActiveRecord::Base
  has_many :episodes
  has_many :judges
  belongs_to :episode
  belongs_to :judge

end
