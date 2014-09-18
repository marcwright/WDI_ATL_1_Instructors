class Dish < ActiveRecord::Base
  has_many :scores
  belongs_to :chef

  validates :item,
    presence: true
  validates :chef_id,
    numericality: true

end
