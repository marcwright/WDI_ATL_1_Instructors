class Chef < ActiveRecord::Base
  has_many :dishes
  has_many :rounds, :through => :dishes
  validates_presence_of :name
  validates_length_of :name, minimum: 3
end
