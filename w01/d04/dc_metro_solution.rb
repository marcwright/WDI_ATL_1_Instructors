# To find the stops between Woodley Park on the Red line and the Beltwater
# stop on the Turquoise line, I would calculate the number of stops between
# Woodley Park and Metro Center on the Red line (3). Then, I would calculate
# the number of stops between Metro Center and the Beltwater stop on the
# Turqoise line, which is 2. I then combine the number of stops for
# a total of 5 stops.

require 'pry'

#===========================================
# Data Setup
#===========================================

red = ['Woodley Park', 'Dupont Circle', 'Farragut North', 'Metro Center', 'Union Station']

turquoise = ['Crystal City', 'Metro Center', 'Shaw-Howard', 'Beltwater']

orange = ['Farragut West', 'McPherson Sq', 'Metro Center', 'Federal Triangle', 'Smithsonian', "L'enfant Plaza"]

dc_metro = {}
dc_metro[:red] = red
dc_metro[:turquoise] = turquoise
dc_metro[:orange] = orange

#===========================================
# Helper Methods
#===========================================

def print_stops_for(line)
  puts ""
  # we iterate through each stop of whatever line is passed to the method,
  # printing it to the screen
  line.each do |stop|
    puts stop
  end
  puts ""
  return nil
end

def print_lines()
  puts ""
  puts "Red"
  puts "Turquiose"
  puts "Orange"
  puts ""
  return nil
end

#===========================================
# Getting the Necessary User Input
#===========================================
puts "What LINE are you getting on?"
print_lines()
starting_line = gets.chomp.downcase
starting_line_stops = dc_metro[starting_line.to_sym]

puts "What STOP are you getting on?"
print_stops_for(starting_line_stops)
starting_station = gets.chomp

puts "What LINE are you getting off from?"
print_lines()
destination_line = gets.chomp.downcase
destination_line_stops = dc_metro[destination_line.to_sym]

puts "What STOP are you getting off at?"
print_stops_for(destination_line_stops)
destination_station = gets.chomp

#===========================================
# Destination
#===========================================

# If the starting line is the same as the ending line, I need to find the difference
# between the index values.
index_of_start_station = starting_line_stops.index(starting_station)
index_of_terminus_station = destination_line_stops.index(destination_station)

if starting_line == destination_line
  distance_between_stops = (index_of_start - index_of_terminus).abs
else
  # If the user is transferring at Metro Center, I need to get 2 values.
    # 1)the stops covered in the first leg of the trip (distance between Metro and Start Station)
    # 2) the stops covered in the second leg of the trip
  first_leg_distance = (index_of_start_station - starting_line_stops.index("Metro Center")).abs
  second_leg_distance = (index_of_terminus_station - destination_line_stops.index("Metro Center")).abs

  # We now add up the stops required from the two legs of the trip
  distance_between_stops = first_leg_distance + second_leg_distance
end

################
# OUTPUT
################
puts "Your trip is #{distance_between_stops} stop(s)."
