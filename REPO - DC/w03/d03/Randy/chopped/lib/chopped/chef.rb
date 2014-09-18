class Chef < ActiveRecord::Base
  has_many :dishes
  belongs_to :episodes
  has_many :scores, through: :dishes
  has_many :judges, through: :scores

  validates_numericality_of :age, only_integer: true
  validates_presence_of :name
  validates_presence_of :home_town
  validates_presence_of :fav_food
end
