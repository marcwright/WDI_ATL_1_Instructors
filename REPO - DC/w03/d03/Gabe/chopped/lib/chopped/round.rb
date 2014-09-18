class Round < ActiveRecord::Base
  validates_presence_of :round_name
  has_many :appearances
  has_many :judges
  has_many :chefs, through: :appearances

end
