class Dish < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  belongs_to :round
  belongs_to :contestant
end
