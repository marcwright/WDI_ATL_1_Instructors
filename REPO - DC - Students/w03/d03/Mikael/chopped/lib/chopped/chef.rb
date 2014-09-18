class Chef < ActiveRecord::Base
  has_many :dishes
  has_many :rounds, :through => :dishes

  validates_presence_of :name

end
