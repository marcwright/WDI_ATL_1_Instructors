story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
  'Fry encounters his grandmother, then inadvertently sires his father'
]

i = 0

while true
  puts "#{story[i]}"
  puts "Should we continue? (y/n)"
  cont = gets.chomp
  break if cont == 'n'
  i += 1
  if i == story.length
    i = 0
  end
end
