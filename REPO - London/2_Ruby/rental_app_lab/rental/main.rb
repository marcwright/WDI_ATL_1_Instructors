require 'pry-byebug'

require_relative 'person'
require_relative 'location'
require_relative 'apartment'

l = Location.new "W1"
l.nearest_tube = "Oxford Circus"
l.affluency = :minted

a1 = Apartment.new "Reeves", 750, 4, 2
a3 = Apartment.new "9 Back Hill", 5000, 12, 4
a2 = Apartment.new "The Beaches", 1000, 5, 2

[a1, a2, a3].each do |appt|
  l.apartments << appt
end

p1 = Person.new "James", "911", :male
p2 = Person.new "Anna", "999", :female

a1.tenants << p1
a2.tenants << p2

binding.pry











