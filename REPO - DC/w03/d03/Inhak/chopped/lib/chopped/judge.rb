class Judge < ActiveRecord::Base
  has_many :scores
  has_many :judgments
  has_many :episodes, :through => :judgments

  validates_presence_of :name, :age, :gender
  validates_associated :scores, :judgments, :episodes
end
