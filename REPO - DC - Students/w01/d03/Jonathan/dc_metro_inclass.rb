red = ['Woodley Park', 'Dupont Circle', 'Farragut North', 'Metro Center', 'Judiciary Square', 'Union Station']
turquoise = ['Crystal City', 'Metro Center', 'Shaw-Howard', 'Beltwater']
orange = ['Farragut West', 'McPherson Sq', 'Metro Center', 'Federal Triangle', 'Smithsonian', 'L\'enfant Plaza']

dc_metro = {}
dc_metro[:red] = red
dc_metro[:turquoise] = turquoise
dc_metro[:orange] = orange

def prompt_stop(line)
  puts line
  puts "CHOOSE A STOP"
  return
end

def list_lines(metro_hash)
  puts metro_hash.keys
end


# ===================
# Grabbing User Input
# ===================

puts "CHOOSE A LINE"
list_lines(dc_metro)
boarding_line = gets.chomp.to_sym

puts "CHOOSE A STOP"
list_stops (dc_metro[boarding_line])
