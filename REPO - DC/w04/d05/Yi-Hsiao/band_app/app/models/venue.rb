class Venue < ActiveRecord::Base
  has_many :events
  has_many :bands, through: :events

  validates :name, presence: true
  validates :city, presence: true
  validates :state, presence: true
end
