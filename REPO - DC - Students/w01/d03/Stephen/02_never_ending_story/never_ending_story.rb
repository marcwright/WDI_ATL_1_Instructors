# Stephen Stanwood (stephen@stanwoodsolutions.com)

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

  print "WANT MORE (YOU KNOW YOU DO)?? "
  break if gets.chomp.downcase == 'n'

  line = (line + 1) % story.length
end
