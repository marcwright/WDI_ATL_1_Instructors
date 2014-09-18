story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
  'Fry encounters his grandmother, then inadvertently sires his father'
]

index = 0

while true
  puts "#{story(index)}"
  puts "Would you like to continue?"
  continue = gets.chomp.downcase

    if continue.include? "yes"
      index = (index + 1) % story.length
    else
      break
    end
end

puts "Story is over"
