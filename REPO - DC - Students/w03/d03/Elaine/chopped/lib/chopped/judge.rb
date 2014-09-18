class Judge < ActiveRecord::Base
  has_many :scores
  has_many :dishes, through: :scores

  validates :name,
    presence: true,
    length: {
      minimum: 2
    }

  validates :restaurant,
    presence: true,
    length: {
      minimum: 2
    }
end
