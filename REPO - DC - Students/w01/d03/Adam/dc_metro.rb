require 'pry'

red = ["WOODLEY PARK", "DUPONT CIRCLE", "FARRAGUT NORTH", "METRO CENTER", "UNION STATION"]
turquoise = ["CRYSTAL CITY", "METRO CENTER", "SHAW-HOWARD", "BELTWATER"]
orange = ["FARRAGUT WEST", "MCPHERSON SQ", "METRO CENTER", "FEDERAL TRIANGLE", "SMITHSONIAN", "L'ENFANT PLAZA"]

dc_metro = {}
dc_metro[:red] = red
dc_metro[:turquoise] = turquoise
dc_metro[:orange] = orange

puts "Here is a list of all the red line stops:"
puts dc_metro[:red]

puts "Enter what stop you want to get on at:"
getson = gets.chomp.upcase

puts "Enter what stop you want to get off at:"
getsoff = gets.chomp.upcase

puts red.index(getson)
puts red.index(getsoff)

travel = (red.index(getson) - red.index(getsoff)).abs

puts "It took you #{travel} stops to get where you are going!"

puts "Here is a list of the red line stops:"
puts dc_metro[:red]

puts "Here is a list of the turquoise line stops:"
puts dc_metro[:turquoise]

puts "What stop do you want to get on?"
getson2 = gets.chomp.upcase

puts "What stop do you want to get off at?"
getsoff2 = gets.chomp.upcase

puts red.index(getson2)
puts turquoise.index(getsoff2)

binding.pry
