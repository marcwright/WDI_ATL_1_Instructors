class Judge < ActiveRecord::Base
  has_many :scores
  has_many :dishes, :through => :scores
  validates_presence_of :name
end
