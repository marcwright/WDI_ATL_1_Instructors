story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
  'Fry encounters his grandmother, then inadvertently sires his father'
]
index = 0
while true
  puts "#{story[index]}"
  puts "Would you like to hear the next part of the story?"
  choice = gets.chomp.downcase
    if choice.include? 'y'
      # index += 1
      index =(index +1) % story.length
    else
      break
    end
    if index == story.length
      index = 0
    end
end

puts "The story has ended!"
