story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
  'Fry encounters his grandmother, then inadvertently sires his father'
]

line = 0
while true

  puts story[line]
  line += 1

  puts "Should we continue? (y/n)"
  continue = gets.chomp.downcase

  break if continue == "n"

  if line >= story.length
    line = 0
  end

end

#if choice.include? 'y'
# line = (line + 1) % story.length
# else

#no need for if statement and you can cycle through ranges/index
