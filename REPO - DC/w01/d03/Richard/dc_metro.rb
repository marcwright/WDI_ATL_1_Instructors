require 'pry'

red = ['Woodley Park', 'Dupont Circle', 'Farragut North', 'Metro Center', 'Judiciary Square', 'Union Station']
turquoise = ['Crystal City', 'Metro Center', 'Shaw-Howard', 'Beltwater']
orange = ['Farragut West', 'McPherson Sq', 'Metro Center', 'Federal Triangle', 'Smithsonian', "L'enfant Plaza"]

def cap(string)
  string.split(" ").map(&:capitalize).join(" ")
end

dc_metro = {}
dc_metro[:red] = red
dc_metro[:turquoise] = turquoise
dc_metro[:orange] = orange

=begin

#========================
#  Instructor Code
#========================

#========================
#  Helper Methods
#========================



def prompt_stop(line)
  puts line
end

def list_lines(metro_hash)
  puts metro_hash.keys
  retrun "LINES!"
end

#========================
#   User Input
#========================


puts "What LINE are you getting on at?"
list_lines(dc_metro)
boarding_line = gets.chomp.to_sym

puts "What STOP are you getting on at?"
list_stops(dc_metro[boarding_line])
boarding_stop = gets.chomp

puts "What LINE are you getting off at?"
list_lines(dc_metro)
destination_line = gets.chomp.to_sym

puts "What STOP are you getting off at?"
list_stops(dc_metro[boarding_line])
destination_stop = gets.chomp

index_of_boarding_stop = dc_metro[boarding_line]

#=========================
#  Single Line Functions
#=========================


boarding_index = dc_metro[boarding_line].index(boarding_stop)
metro_center_index = dc_metro[boarding_line].index("Metro Center")
first_leg_distance = (boarding_index - metro_center_index).abs

boarding_index = dc_metro[destination_line].index(destination_stop)
metro_center_index2 = dc_metro[destination_line].index("Metro Center")
first_leg_distance = (boarding_index - metro_center_index).abs

destination_index = dc_metro[destination_line].index(destination_stop)
destination_bw_stops = (boarding_index - destination_index).abs
=end
colors = ["Red", "Turquoise", "Orange"]
colors.each {|n| puts n}
puts "Which Metro line would you like to get on?"
entry_line = gets.chomp.downcase
  if entry_line == "red"
    red.each {|i| puts i}
    puts "Which Metro stop are you at?"
    stop = gets.chomp
    stop = cap(stop)
  elsif entry_line == "turquoise"
    turquoise.each {|i| puts i}
    puts "Which Metro stop are you at?"
    stop = gets.chomp
    stop = cap(stop)
  else
    orange.each {|i| puts i}
    puts "Which Metro stop are you at?"
    stop = gets.chomp
    stop = cap(stop)
  end

colors = ["Red", "Turquoise", "Orange"]
colors.each {|n| puts n}
puts "Which Metro line would you like to get on?"
dest_line = gets.chomp.downcase
puts "What is your destination?"
if dest_line == "red"
    red.each {|i| puts i}
    puts "Which Metro stop are you at?"
    dest = gets.chomp
    dest = cap(dest)
  elsif dest_line == "turquoise"
    turquoise.each {|i| puts i}
    puts "Which Metro stop are you at?"
    dest = gets.chomp
    dest = cap(dest)
  else
    orange.each {|i| puts i}
    puts "Which Metro stop are you at?"
    dest = gets.chomp
    dest = cap(dest)
  end

  if entry_line == 'red' &&  dest_line == 'red'
  stops = (dc_metro[:red].index(stop).to_i - dc_metro[:red].index(dest).to_i).abs

  elsif entry_line == 'orange' &&  dest_line == 'orange'
  stops = (dc_metro[:orange].index(stop).to_i - dc_metro[:orange].index(dest).to_i).abs

  elsif entry_line == 'turquoise' &&  dest_line == 'turquoise'
  stops = (dc_metro[:turquoise].index(stop).to_i - dc_metro[:turquoise].index(dest).to_i).abs

  elsif entry_line == 'red' || entry_line == 'orange' && dest_line == 'orange' || dest_line =='red'

    stops = (dc_metro[:red].index(stop).to_i - dc_metro[:red].index("Metro Center").to_i).abs + (dc_metro[:orange].index("Metro Center").to_i - dc_metro[:orange].index(dest).to_i).abs

  elsif entry_line == 'red' || entry_line == 'turquoise' && dest_line == 'turquoise' || dest_line =='red'

    stops = (dc_metro[:red].index(stop).to_i - dc_metro[:red].index("Metro Center").to_i).abs + (dc_metro[:turquoise].index("Metro Center").to_i - dc_metro[:turquoise].index(dest).to_i).abs
binding.pry
  else

        stops = (dc_metro[:turquoise].index(stop).to_i - dc_metro[:turquoise].index("Metro Center").to_i).abs + (dc_metro[:orange].index("Metro Center").to_i - dc_metro[:orange].index(dest).to_i).abs
end
puts "There are #{stops} stops between #{stop} and #{dest}."
