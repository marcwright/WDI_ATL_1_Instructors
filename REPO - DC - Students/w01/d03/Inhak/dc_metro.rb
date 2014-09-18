require 'pry'

red = ['Woodley Park', 'Dupont Circle', 'Farragut North', 'Metro Center', 'Union Station']
turquoise = ['Crystal City', 'Metro Center', 'Shaw-Howard', 'Beltwater']
orange = ['Farragut West', 'McPherson Sq', 'Metro Center', 'Federal Triangle', 'Smithsonian', "L'enfant Plaza"]

dc_metro = {}
dc_metro[:red] = red
dc_metro[:turquoise] = turquoise
dc_metro[:orange] = orange

def stop_printer(user_input, array)
    return array[user_input.to_sym]
end

puts "what line do you get on at? (red or turquoise or orange)"
user_line = gets.chomp.downcase
puts "The stops on this line are: #{stop_printer(user_line, dc_metro)}"
puts "What stop are you getting on at?"
user_enter = gets.chomp.downcase

puts "what line are you getting off at? (red or turquoise or orange)"
user_line_exit = gets.chomp.downcase
puts "The stops on this line are #{stop_printer(user_line_exit, dc_metro)} "
puts "What stop do you want to get off at?"
user_exit = gets.chomp.downcase

def array_downcase(array)
  array.each do |x|
    x.downcase!
  end
end

array_downcase(red)
array_downcase(turquoise)
array_downcase(orange)

chewed1 = stop_printer(user_line, dc_metro)
chewed2 =stop_printer(user_line_exit, dc_metro)

def find_station_index(line, stop)
  line.each do |x|
    if x = stop
      return line.find_index(stop)
    end
  end
end

start_station_index = find_station_index(chewed1, user_enter)
metro_center_first_index = find_station_index(chewed1, "metro center")
metro_center_second_index = find_station_index(chewed2, "metro center")
stop_station_index = find_station_index(chewed2, user_exit)

stops_away = (start_station_index - metro_center_first_index).abs + (stop_station_index - metro_center_second_index).abs

puts "you are #{stops_away} stops away from your destination."
