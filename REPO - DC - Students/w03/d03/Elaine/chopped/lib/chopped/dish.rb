class Dish < ActiveRecord::Base
  belongs_to :round
  belongs_to :chef
  has_many :scores
  has_many :judges, through: :scores

  validates :name,
    presence: true,
    length: {
      minimum: 2
    }
end
