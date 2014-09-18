require 'pry'
# To find the stops between Woodley Park on the Red line and Beltway stop on the turquoise line, I would calculate the numbers of stops between Woodley Park and Metro Center on the Red line (3 stops), then calculate the num of stops between MC and the Beltway stop on the Turq line (2) stops. I then comebine the numbers of stops for a total of 5 stops.

red = ['Woodley Park', 'Dupont Circle', 'Farragut North', 'Metro Center', 'Union Station']

turquoise = ['Crystal City', 'Metro Center', 'Shaw-Howard', 'Beltwater']

orange = ['Farragut West', 'McPherson Sq', 'Metro Center', 'Federal Triangle', 'Smithsonian', "L'enfant Plaza"]

dc_metro = {}
dc_metro[:red] = red
dc_metro[:turquoise] = turquoise
dc_metro[:orange] = orange

#====================
# Helper methods
#====================
def list_stops(line)
  puts""
  puts line
  puts""
end

def list_lines(metro_hash)
  puts ""
  puts metro_hash.keys
  puts""
  return "ohhh, look at these lines"
end

#====================
# Grabbing User Input
#====================

puts "What LINE are you getting on at?"
list_lines(dc_metro)
boarding_line = gets.chomp.to_sym


puts "What STOP are you getting on at?"
list_stops(dc_metro[boarding_line])
boarding_stop = gets.chomp

puts "What LINE are you getting OFF at?"
list_lines(dc_metro)
destination_line = gets.chomp.to_sym

puts "What STOP are you getting OFF at?"
list_stops(dc_metro[destination_line])
destination_stop = gets.chomp

index_of_boarding_stop = dc_metro[boarding_line]


#=================
# SINGLE LINE FUNC
#=================

boarding_index = dc_metro[boarding_line].index(boarding_stop)
metro_center_index1 = dc_metro[boarding_line].index("Metro Center")
first_leg_distance = (boarding_index - metro_center_index1).abs

destination_index = dc_metro[destination_line].index(destination_stop)
metro_center_index2 = dc_metro[boarding_line].index("Metro Center")
second_leg_distance = (metro_center_index2 - destination_index).abs

total_distance = second_leg_distance + first_leg_distance

puts "Your trip is #{total_distance} stops!"









