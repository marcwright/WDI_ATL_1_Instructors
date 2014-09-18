class Dog < ActiveRecord::Base
  has_many :toys
  validates :name, presence: true, length: { minimum: 3 }
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
