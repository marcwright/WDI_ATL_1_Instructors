#require 'pry'

red = ['Woodley Park', 'Dupont Circle', 'Farragut North', 'Metro Center', 'Judiciary Square', 'Union Station']
turquoise = ['Crystal City', 'Metro Center', 'Shaw-Howard', 'Beltwater']
orange = ['Farragut West', 'McPherson Sq', 'Metro Center', 'Federal Triangle', 'Smithsonian', 'L\'enfant Plaza']


dc_metro = {}
dc_metro[:red] = red
dc_metro[:turquoise] = turquoise
dc_metro[:orange] = orange

puts "DC Metro: Red, Turquoise and Orange Lines"
puts "What line would you like to travel on?"
line_1 = gets.chomp.to_sym.downcase

puts "Great, here are the choices on that line"
puts dc_metro[line_1]

puts "What stop would you like to leave from?"
start = gets.chomp

puts "What line will you be ending your trip?"
line_2 = gets.chomp.to_sym.downcase

puts "Here are your destination choices"
puts dc_metro[line_2]

puts "What stop would you like to go to?"
stop = gets.chomp

num_stops=[]

if line_1 != line_2
  puts "Your trip will take #{dc_metro[line_1].index('Metro Center') - dc_metro[line_1].index(start) + dc_metro[line_2].index(stop) - dc_metro[line_2].index('Metro Center')} stops."
else
  puts "Your trip will take #{dc_metro[line_1].index(stop) - dc_metro[line_1].index(start)} stops."
end


# now = line_1.index(start)
# later = line_2.index(stop)
# distance = later - now



# if distance = true

# else condition

# end

# puts "You have traveled #{distance} stops."




