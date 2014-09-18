class Episode < ActiveRecord::Base
  has_many :chefs
  has_many :rounds
  has_many :judgments
  has_many :judges, :through => :judgments

  validates_presence_of :epi_num, :season, :air_date
  validates_associated :chefs, :rounds, :judgments, :judges

end
