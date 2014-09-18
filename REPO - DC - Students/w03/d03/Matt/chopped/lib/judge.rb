require_relative: "chopped"

class Judge < ActiveRecord::Base
  has_many :scores
end
