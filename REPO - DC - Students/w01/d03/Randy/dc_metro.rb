red = ['Woodley Park', 'Dupont Circle', 'Farragut North', 'Metro Center', 'Judiciary Square', 'Union Station']
turquoise = ['Crystal City', 'Metro Center', 'Shaw-Howard', 'Beltwater']
orange = ['Farragut West', 'McPherson Sq', 'Metro Center', 'Federal Triangle', 'Smithsonian', "L'enfant Plaza"]

dc_metro = {}
dc_metro[:red] = red
dc_metro[:turquoise] = turquoise
dc_metro[:orange] = orange

def how_far(hash, line, stop)
	distance = (hash[line].index(stop) - hash[line].index("Metro Center")).abs
	return distance
end

def what_line(hash, line)
  stop_list = hash[line].join(" <--> ")
  puts "#{line.to_s.capitalize} Line Stations are: #{stop_list}."
	return line
end

go_again = ""
while go_again != "n"
	puts "Welcome to the DC Metro -- We're Terrible!"
	puts "What line will you be entering? (Red, Turquoise, Orange)"
	begin_line = what_line(dc_metro, gets.chomp.downcase.to_sym)
	puts "What's the stop you'll get on at?"
		begin_stop = gets.chomp
		begin_local = dc_metro[begin_line].index(begin_stop)
	puts "What line are you exiting? (Red, Turquoise, Orange)"
	end_line = what_line(dc_metro, gets.chomp.downcase.to_sym)
	puts "What's the stop you'll be getting off at?"
		end_stop = gets.chomp
		end_local = dc_metro[end_line].index(end_stop)


	if begin_line != end_line && end_stop != "Metro Center"
		distance = how_far(dc_metro, begin_line, begin_stop) + how_far(dc_metro, end_line, end_stop)
	else
		distance = (end_local - begin_local).abs
	end

	puts "\nYou will be to your destination in #{distance} stop(s)."		
	puts "Thank you for enduring Metro, would you like to see another trip? (y/n)"	
	go_again = gets.chomp.downcase
end	