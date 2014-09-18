class Episode < ActiveRecord::Base
  has_many :rounds
  has_many :chefs

  validates :episode_name,
    presence: true

  validates :season_number,
    numericality: {
      only_integer: true
    }

  validates :episode_number,
    numericality: {
      only_integer: true
    }
end
