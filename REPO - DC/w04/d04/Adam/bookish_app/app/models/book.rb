class Book < ActiveRecord::Base
  belongs_to :authors
  has_many :characters
end
