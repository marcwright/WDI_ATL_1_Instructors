class Judge < ActiveRecord::Base
  has_many :scores
  has_many :dishes, :through => :scores

  validates :name,
    presence: true
end
