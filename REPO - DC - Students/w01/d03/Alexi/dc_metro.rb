require 'pry'

red = ['woodley park', 'dupont circle', 'farragut north', 'metro center', 'judiciary square', 'union station']
turquoise = ['crystal city', 'cetro center', 'shaw-howard', 'beltwater']
orange = ['farragut west', 'mcpherson square', 'metro center', 'federal friangle', 'smithsonian', "l'enfant plaza"]

dc_metro = {}
dc_metro[:red] = red
dc_metro[:turquoise] = turquoise
dc_metro[:orange] = orange

# puts "The following are the RED LINE metro stops: "
# puts "1. Woodley Park"
# puts "2. Dupont Circle"
# puts "3. Farragut North"
# puts "4. Metro Center"
# puts "5. Judiciary Square"
# puts "6. Union Station"

# puts "Please select your initial stop"
#   fstop = gets.chomp.downcase
# puts "Please select your last stop (1-6)"
#   lstop = gets.chomp.downcase


# fvar = red.index(fstop)
# lvar = red.index(lstop)

# #Can't figure out why this won't return the index number. It should be
# #captured by red.index(fstop/lstop)
# puts "#{fvar}"
# puts "#{lvar}"

# def prompt_stop(line, array_of_stops)
#   string_of_stops = array_of_stops.join (', ')
#   puts "These are stops on this line. Please choose one."
#   return
# end

#================================#
#=========Helper Methods=========#
#================================#


def list_stops(line)
  puts ""
  puts line
  puts ""
end

def list_lines(metro_hash)
  puts ""
  puts metro_hash.keys
  return "Look at these lines"
end

#================================#
#======Grabbing User Input=======#
#================================#

puts "What LINE are you getting off at?"
  list_lines(dc_metro)
  boarding_line = gets.chomp.to_sym

puts "What stop are you getting on at?"
  list_stops(dc_metro[boarding_line])
  boarding_stop = gets.chomp

puts "What LINE are you getting OFF at?"
  list_lines(dc_metro)
  destination_line = gets.chomp.to_sym

puts "What STOP are you getting OFF at? "
  list_stops(dc_metro[destination_line])

index_of_boarding_stop = dc_metro[boarding_line]

#================================#
#======Single Line Function======#
#================================#

boarding_index = dc_metro[boarding_line].index(boarding_stop)
metro_center = dc_metro[boarding_line].index("Metro Center")
first_leg_distance = (boarding_index = metro_center).abs

destination_index = dc_metro[]

boarding_index = red.index(boarding_stop)
destination_index = red.index(destination_stop)

stop_distance = (boarding_index - destination_index).abs
