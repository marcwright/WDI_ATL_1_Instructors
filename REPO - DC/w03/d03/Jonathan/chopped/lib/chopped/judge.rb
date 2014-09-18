class Judge < ActiveRecord::Base
  has_many :rounds
  belongs_to :scores
  validates :name, presence: true
  validates :name, length: { maximum: 100 }
end

