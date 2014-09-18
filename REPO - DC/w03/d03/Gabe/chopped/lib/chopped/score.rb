class Score < ActiveRecord::Base
 validates_presence_of :dish_score
 validates_numericality_of :dish_score
 belongs_to :dish
 belongs_to :judge
end
