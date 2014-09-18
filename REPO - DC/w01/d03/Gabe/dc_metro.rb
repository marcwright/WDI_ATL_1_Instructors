red = ['Woodley Park', 'Dupont Circle', 'Farragut North', 'Metro Center', 'Union Station']
turquoise = ['Crystal City', 'Metro Center', 'Shaw-Howard', 'Beltwater']
orange = ['Farragut West', 'McPherson Sq', 'Metro Center', 'Federal Triangle', 'Smithsonian', "L'enfant Plaza"]

dc_metro = {}
dc_metro[:red] = red
dc_metro[:turquoise] = turquoise
dc_metro[:orange] = orange



puts "   NOW BOARDING!"
print "."
sleep 1
print "."
sleep 1
print "."
sleep 1
print "."
sleep 1
puts " DC METRO ...."
puts ""

	puts "What line are you boarding on? red"
	boarding_line = gets.chomp.downcase

	#case boarding_line
	#when "red" 
	#	"red" == red
	#when "orange" 
	#	"orange" == orange
	#else 
	#	 boarding_line == turquoise
#
	#end

	puts red.index.join("---")   #good old line show-er

	#puts dc_metro(destination_line).join("---")   fucked up smart line-show-er

	puts "What stop will you board at?"
	boarding_stop = gets.chomp

	puts "What line is your destination on? red, orange, turquoise ?"
	destination_line = gets.chomp.downcase

	#puts dc_metro(destination_line).join("---")

	puts "What stop is your destination at?"
	destination_stop = gets.chomp

	


#----------------------------------------------#


	puts red.index

	red.each_with_index do |station, index|
	end

	a = red.index(boarding_stop)

	b = red.index(destination_stop)
	#if I can make these 'red' values variable depending on user boarding-line input, GOOD!



trip = (a - b)
trip  = trip.abs


puts "You made #{trip} stops."





#case boarding_line
#
#
#when red
#
#when orange
#
#when turquoise
#
#
#	puts "What is your destination stop?"
#	destination_stop = gets.chomp
#
#
#end
#	
#a = red.index(boarding_stop)
#
#b = red.index(destination_stop)
#
#trip = (a - b)
#trip  = trip.abs
#
#puts "You made #{trip} stops."


# TO DO
# add changed keys for the RED, ORANGAE, TURQ arrays on each line, showing the relation of each stop to
#metro center. (union station -1  metro center 0   first station 1  second station 2)
# find boarding statio, line,    dest. station and line
#find the stations passed through for '1st leg'
# check if dest is on different line
# if so, find stations-passed-through for '2nd leg' from 0 to ...?
#
# print out total passed through for 1st and 2nd leg.
#
#