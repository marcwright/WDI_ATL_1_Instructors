require "pry"

red = ['woodley park', 'dupont circle', 'farragut north', 'metro center', 'union station']
turquoise = ['crystal city', 'metro center', 'shaw', 'beltwater']
orange = ['farragut west', 'mcpherson', 'metro center', 'federal triangle', 'smithsonian', "l'enfant plaza"]

dc_metro = {}
dc_metro[:red] = red
dc_metro[:turquoise] = turquoise
dc_metro[:orange] = orange

lines = dc_metro.keys # key variable

puts "\nWelcome to Metro.\n"

puts "\nHere are all of the possible lines:\n"
puts lines

puts "\nWhich line are you starting with?"
line1 = gets.chomp.to_sym

puts "\nHere are the stops on #{line1} line:\n"
puts dc_metro[line1]

puts "\nWhere will you start?\n"
first_stop = gets.chomp

puts "\nHere are all of the possible lines:\n"
puts lines

puts "\nOn which line will you stop?\n"
line2 = gets.chomp.to_sym

puts "\nHere are all of the stops on #{line2} line:\n"
puts dc_metro[line2]

puts "\nWhat is your final stop?\n"
last_stop = gets.chomp

single_trip = (dc_metro[line2].index(last_stop) - dc_metro[line1].index(first_stop)).abs
double_trip = single_trip + 1

binding.pry

if dc_metro[line1] != dc_metro[line2]
  puts "\nYou traveled metro for #{double_trip} stops between the #{line1} and #{line2} lines"
else
  puts "\nYou traveled metro for #{single_trip} stops and 0 transfers."
end

puts "Please be aware the escalators at #{last_stop.capitalize} are out of order."
