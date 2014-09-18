# Steps to find number of stops between Woodley Park (red) and Beltwater (turquoise)
# 1) need to number each station's distance from Metro Center
# 2) Woodley Park would be 3 and Beltwater would be 2
# 3) take  value and add together to get 5 stops

red = ['Woodley Park', 'Dupont Circle', 'Farragut North', 'Metro Center', 'Judiciary Square', 'Union Station']
turquoise = ['Crystal City', 'Metro Center', 'Shaw-Howard', 'Beltwater']
orange = ['Farragut West', 'McPherson Sq', 'Metro Center', 'Federal Triangle', 'Smithsonian', "L'enfant Plaza"]

dc_metro = {}
dc_metro[:red] = red
dc_metro[:turquoise] = turquoise
dc_metro[:orange] = orange

puts "What line do you want to get on?"
# puts "- Red"
# puts "- Turquoise"
# puts "- Orange"
puts dc_metro.keys
line_depart = gets.chomp.downcase.to_sym

puts "The stations on the #{line_depart} are " + dc_metro[line_depart].join(", ")
puts "What station are you departing from? (case-sensitive)"
station_depart = gets.chomp

puts "What line are you getting off on?"
# puts "- Red"
# puts "- Turquoise"
# puts "- Orange"
puts dc_metro.keys
line_arrive = gets.chomp.downcase.to_sym

puts "The stations on the #{line_arrive} are " + dc_metro[line_arrive].join(", ")
puts "What station are you arriving at? (case-sensitive)"
station_arrive = gets.chomp

if line_depart != line_arrive
  to_metro_center = (dc_metro[line_depart].index(station_depart) - dc_metro[line_depart].index("Metro Center")).abs
  from_metro_center = (dc_metro[line_arrive].index(station_arrive) - dc_metro[line_arrive].index("Metro Center")).abs

  puts "Your trip will be  #{to_metro_center + from_metro_center} stop(s)."

else
  boarding_index = dc_metro[line_depart(station_depart).index]
  destination_index = dc_metro[line_arrive(station_arrive).index]

  puts "Your trip will be #{(boarding_index - destination_index).abs} stops."

end
