class Planet < ActiveRecord::Base
  attr_accessible :diameter, :galaxy_id, :image, :mass, :name, :orbit
  has_many :moons
  belongs_to :galaxy
end
