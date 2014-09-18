red = ['Woodley Park', 'Dupont Circle', 'Farragut North', 'Metro Center', 'Judiciary Square', 'Union Station']
turquoise = ['Crystal City', 'Metro Center', 'Shaw-Howard', 'Beltwater']
orange = ['Farragut West', 'McPherson Sq', 'Metro Center', 'Federal Triangle', 'Smithsonian', "L'enfant Plaza"]

dc_metro = {}
#why do we need to define dc_metro {}
dc_metro[:red] = red
dc_metro[:turquoise] = turquoise
dc_metro[:orange] = orange


puts "What line do you want to get on?"
line1 = gets.chomp.to_sym.downcase

puts "Great, here are your choices on the #{line1} line:"
puts dc_metro[line1]

puts "Where will you start your journey?"
start = gets.chomp

puts "Ok, on what line would you like to end your journey"
line2 = gets.chomp.to_sym.downcase

puts "Sure, here are your choices on the #{line2} line"
puts dc_metro[line2]

puts "Great, now where would you like to terminate your journey?"
terminate = gets.chomp

if line1 != line2 
   puts "Your journey involve\'s a transfer and will be #{dc_metro[line1].index('Metro Center') - dc_metro[line1].index(start) + (dc_metro[line2].index(terminate) - dc_metro[line2].index('Metro Center')).abs} stops."
else
   puts "Your journey does not involve a transfer and will be #{dc_metro[line1].index(terminate) - dc_metro[line1].index(start)} stops"
end   
 
