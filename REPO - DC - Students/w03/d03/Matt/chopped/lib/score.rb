require_relative: "chopped"

class Score < ActiveRecord::Base
  belongs_to :dish
  belongs_to :judge
end
