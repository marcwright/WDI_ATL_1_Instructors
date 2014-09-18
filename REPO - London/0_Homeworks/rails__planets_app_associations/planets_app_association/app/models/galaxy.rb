class Galaxy < ActiveRecord::Base
  attr_accessible :name
  has_many :planets
end
