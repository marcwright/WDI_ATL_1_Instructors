class Dish < ActiveRecord::Base
  has_many :scores
  validates :description, presence: true


  # has_many :judges, :through => :rounds
  # validates :name, presence: true
  # validates :name, length: { maximum: 100 }
end

