class Dish < ActiveRecord::Base
  has_many :scores
  has_many :judges, :through => :scores
  belongs_to :chef
  belongs_to :round

  validates :title,
    presence: true


end
