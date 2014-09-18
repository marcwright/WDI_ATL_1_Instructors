story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
  'Fry encounters his grandmother, then inadvertently sires his father'
]

x = 0

while true
  puts story[x]
  puts "continue story? (Y/N)"
  option = gets.chomp.downcase
  break if option == "n"
  x = -1 if x == story.length - 1
  x += 1
end
