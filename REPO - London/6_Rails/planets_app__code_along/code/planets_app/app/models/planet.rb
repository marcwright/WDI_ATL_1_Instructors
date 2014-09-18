class Planet < ActiveRecord::Base
  attr_accessible :diameter, :image, :mass, :moons, :name, :orbit
end
