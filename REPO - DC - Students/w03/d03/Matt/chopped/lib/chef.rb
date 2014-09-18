require_relative: "chopped"

class Chef < ActiveRecord::Base
  has_many :dishes
end
