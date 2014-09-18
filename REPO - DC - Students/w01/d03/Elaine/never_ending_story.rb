story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
  'Fry encounters his grandmother, then inadvertently sires his father'
]

index_counter = 0

puts story[0]
index_counter += 1

puts "Should we continue? (y/n)"
answer = gets.chomp.downcase

while true
    puts story[index_counter]
    index_counter += 1

    if index_counter > 4
    index_counter = 0

    #index = (index +1) % story.length

    end
  puts "Should we continue? (y/n)"
  answer = gets.chomp.downcase
 break if answer == "n"
end




