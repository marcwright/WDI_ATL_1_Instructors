class Moon < ActiveRecord::Base
  attr_accessible :is_solid, :name, :planet_id
  belongs_to :planet
end
