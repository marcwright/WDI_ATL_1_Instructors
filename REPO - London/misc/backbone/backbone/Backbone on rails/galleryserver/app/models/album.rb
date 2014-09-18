class Album < ActiveRecord::Base
  has_many :images
  attr_accessible :title
end
