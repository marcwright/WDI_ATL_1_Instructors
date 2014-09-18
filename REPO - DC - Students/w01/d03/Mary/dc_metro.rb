red = ['WOODLEY PARK', 'DUPONT CIRCLE', 'FARRAGUT NORTH', 'METRO CENTER', 'JUDICIARY SQUARE', 'UNION STATION']
turquoise = ['CRYSTAL CITY', 'METRO CENTER', 'SHAW-HOWARD', 'BELTWATER']
orange = ['FARRAGUT WEST', 'MCPHERSON SQ', 'METRO CENTER', 'FEDERAL TRIANGLE', 'SMITHSONIAN', "L'ENFANT PLAZA"]

dc_metro = {}
dc_metro[:red] = red
dc_metro[:turquoise] = turquoise
dc_metro[:orange] = orange

puts "Welcome to DC Metro! What line would you like to get on? Options are red, turquoise, and orange."
line_start = gets.chomp.downcase.to_sym
puts "Great! The stations on the #{line_start} line are " + dc_metro[line_start].join(", ") + ". Where would you like to get on?"
station_start = gets.chomp.upcase

puts "Okay, and which line would you like to get off at?"
line_stop = gets.chomp.downcase.to_sym
puts "Great! The stations on the #{line_stop} line are " + dc_metro[line_stop].join(", ") + ". Where would you like to get off?"
station_stop = gets.chomp.upcase

first_leg = (dc_metro[line_start].index(station_start) - dc_metro[line_start].index("METRO CENTER")).abs
second_leg = (dc_metro[line_stop].index(station_stop) - dc_metro[line_stop].index("METRO CENTER")).abs

puts "Your trip will be #{first_leg + second_leg} stop(s)."

