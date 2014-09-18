class Chef < ActiveRecord::Base
  has_many :dishes
  has_many :rounds, through: :dishes

  validates :name,
    presence: true,
    length: {
      minimum: 2
    }

  validates :hometown,
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
