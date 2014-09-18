story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
  'Fry encounters his grandmother, then inadvertently sires his father']

n = 0

while true
	puts "#{story[n]}"
	puts "Would you like to continue (y/n)?"
	response  = gets.chomp.downcase
	break if response == "n"

	n += 1
	if n == story.length
		n = 0
	end

end
puts "Why not Zoidberg!?!?!?"