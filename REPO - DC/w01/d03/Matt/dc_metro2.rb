# to find stops between woodley on red and beltway on turquoise
# calculate red stops (3) then calculate turquoise stops between mc and destination (2)
# find and combine total stops (5)

require "pry"

red = ['woodley park', 'dupont circle', 'farragut north', 'metro center', 'union station']
turquoise = ['crystal city', 'metro center', 'shaw', 'beltwater']
orange = ['farragut west', 'mcpherson', 'metro center', 'federal triangle', 'smithsonian', "l'enfant plaza"]

dc_metro = {}
dc_metro[:red] = red
dc_metro[:turquoise] = turquoise
dc_metro[:orange] = orange

#==============
# Helper Methods
#==============

def list_stops(line)
  puts line
  return "all the stops on a line"
end

# prompt_stop(dc_metro[:red]) # test above method to show array items for a key

def list_lines(metro_hash)
  puts metro_hash.keys
  return "all the lines"
end

# list_lines(dc_metro) # test above method to show all keys

puts "Which line are you starting with?"
list_lines(dc_metro)
boarding_line = gets.chomp.to_sym

puts "Which stop are you starting with?"
list_stops(dc_metro[boarding_line])
boarding_stop = gets.chomp

puts "Which line are you starting with?"
list_lines(dc_metro)
destination_line = gets.chomp.to_sym

puts "Which stop are you starting with?"
list_stops(dc_metro[destination_line])
destination_stop = gets.chomp

# stops = dc_metro[boarding_line].index

if boarding_line != destination_line

  boarding_index = dc_metro[boarding_line].index(boarding_stop)
  metro_center_index1 = dc_metro[boarding_line].index('metro center')
  first_leg_stops = (boarding_index - metro_center_index1).abs

  destination_index = dc_metro[destination_line].index(destination_stop)
  metro_center_index2 = dc_metro[destination_line].index('metro center')
  second_leg_stops = (destination_index - metro_center_index2).abs

  total_multiple_stops = (first_leg_stops - second_leg_stops).abs
  puts "#{total_multiple_stops}"
else
  total_single_stops = (boarding_index - destination_index).abs
  puts "#{total_single_stops}"
end

binding.pry
