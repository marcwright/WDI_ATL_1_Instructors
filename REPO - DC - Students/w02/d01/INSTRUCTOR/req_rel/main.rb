require 'pry'
require_relative 'models/apartment'
require_relative 'models/building'

apartment = Apartment.new("4th Floor")
puts apartment

building = Building.new("GA")
puts building