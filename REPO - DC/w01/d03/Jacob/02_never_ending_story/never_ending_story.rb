story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
  'Fry encounters his grandmother, then inadvertently sires his father'
]
puts "Welcome to the never-ending story!"
puts "Would you like to continue? (y/n)"
answer = gets.chomp.downcase
count = 0
while answer == "y"
  puts story[count]
  puts "Would you like to continue? (y/n)"
  answer = gets.chomp.downcase
  count += 1
  break if answer == "n"
  if count == story.length
    count -= story.length
  end
end
puts "The story has ended!"
