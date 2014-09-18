story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
  'Fry encounters his grandmother, then inadvertently sires his father'
]

story_line = 0

while true

	puts story[story_line]
	puts "Should we continue? (y/n)"
	continue = gets.chomp
	if "y"
		puts story[story_line]
		story_line += 1
	else
		puts "ok, thanks for reading"
	end
end




