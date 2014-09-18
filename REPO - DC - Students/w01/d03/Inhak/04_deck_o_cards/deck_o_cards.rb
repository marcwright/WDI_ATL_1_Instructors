def deck_o_cards
  values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  suits = ['hearts', 'diamonds', 'clubs', 'spades']

  # ... build your deck ...
  deck = []
  suits.each do |suit|
    values.each do |value|
      deck.push({suit: suit, value: value})
    end
  end

  return deck.shuffle
end

puts deck_o_cards

puts "the deck has #{deck_o_cards.length} cards"
puts "the top card has #{deck_o_cards.first}"
