
red = ['Woodley Park', 'Dupont Circle', 'Farragut North', 'Metro Center', 'Judiciary Square', 'Union Station']
turquoise = ['Crystal City', 'Metro Center', 'Shaw-Howard', 'Beltwater']
orange = ['Farragut West', 'McPherson Sq', 'Metro Center', 'Federal Triangle', 'Smithsonian', "L'enfant Plaza"]

dc_metro = {}
dc_metro[:red] = red
dc_metro[:turquoise] = turquoise
dc_metro[:orange] = orange


continue = "y"
while true
  puts "What line do you want to get on?"
  line_on = gets.chomp.to_sym

  puts "These are your choices on the #{line_on} line: #{dc_metro[line_on].join(', ')}"

  # real_choice = false
  # while real_choice == true
  #   puts "What stop do you want to get on?"
  #   on_stop = gets.chomp
  #     if !dc_metro.include?(on_stop)
  #       puts "Not a choice!"
  #       real_choice = false
  #     end
  # end
  puts "What stop do you want to get on?"
  on_stop = gets.chomp


  puts "What line do you want to get off on?"
  line_off = gets.chomp.to_sym

  puts "These are your choices on the #{line_off} line: #{dc_metro[line_off].join(', ')}"

  puts "What stop do you want to get off at?"
  off_stop = gets.chomp

  puts "You're getting on at #{on_stop} on #{line_on} and getting off at #{off_stop} on #{line_off}."

#line_on not line_off, calculate stops to metro ctr on each line
  if line_on != line_off
    to_met_ctr = (dc_metro[line_on].index(on_stop) - dc_metro[line_on].index("Metro Center")).abs
    from_met_ctr = (dc_metro[line_off].index(off_stop) - dc_metro[line_off].index("Metro Center")).abs
    puts "You'll have to travel #{to_met_ctr + from_met_ctr} stops"
  else
    num_stops = (dc_metro[line_on].index(on_stop) - dc_metro[line_off].index(off_stop)).abs
    puts "You'll have to travel #{num_stops} stops."
  end


puts "Want to continue? (y/n)"
continue = gets.chomp.downcase
break if continue == "n"
end
