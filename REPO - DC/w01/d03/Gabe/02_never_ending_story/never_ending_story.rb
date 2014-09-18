

story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
  'Fry encounters his grandmother, then inadvertently sires his father'
]

#a while loop for calling up lines from the story array:


counter = 0
while true

	puts " #{story[counter]} "
	counter = counter + 1 #this rolls the counter up one after printing a line.
	if counter == 5 #after running 5 lines, roll back to line '0'
		then counter = 0
	end
	puts "should we continue? y /n "
	continue = gets.chomp.downcase

	break if continue == "n"
	


end

puts "the end"
