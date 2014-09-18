require 'pry'

require_relative 'movie'
require_relative 'rental'
require_relative 'customer'


c = Customer.new('fred')
cars = Movie.new('Cars', Movie::CHILDRENS)
star_wars = Movie.new('Star Wars', Movie::REGULAR)
red2 = Movie.new('Red2', Movie::NEW_RELEASE)
c.add_rental Rental.new(cars, 4)
c.add_rental Rental.new(star_wars, 1)
c.add_rental Rental.new(red2, 3)
puts c.statement


binding.pry
