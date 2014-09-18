class Chef < ActiveRecord::Base
  has_many :rounds
  has_many :judges, :through => :rounds
  validates :name, presence: true
  validates :name, length: { maximum: 100 }
end

