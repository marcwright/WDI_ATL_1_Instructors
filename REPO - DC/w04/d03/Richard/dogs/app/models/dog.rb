class Dog < ActiveRecord::Base
  #giving all dogs a toy method
  has_many :toys
end
