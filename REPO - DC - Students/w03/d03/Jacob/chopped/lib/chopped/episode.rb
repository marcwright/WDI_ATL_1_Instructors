class Episode < ActiveRecord::Base
  has_many :chefs, dependent: :destroy
  has_many :rounds, dependent: :destroy

  validates_presence_of :title
  validates_numericality_of :season_number, only_integer: true
  validates_numericality_of :episode_number, only_integer: true
end
