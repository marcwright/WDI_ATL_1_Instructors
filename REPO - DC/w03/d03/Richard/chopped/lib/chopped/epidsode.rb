class Episode < ActiveRecord::Base
  has_many :chefs
  has_many :judges, through: :judgment
  has_many :rounds
  belongs_to :judgment

  validates_presence_of :episode_no, :season_no
end
