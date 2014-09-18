class Movie < ActiveRecord::Base
  validates :name, presence: true
  validates :year, presence: true
  validates :rating, presence: true
  validates :plotsum, presence: true
  validates :poster, presence: true


end
