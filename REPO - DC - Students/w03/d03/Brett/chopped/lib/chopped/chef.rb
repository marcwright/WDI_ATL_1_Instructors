class Contestant < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  has_many :dishes
  has_many :rounds, through: :appointments
end
