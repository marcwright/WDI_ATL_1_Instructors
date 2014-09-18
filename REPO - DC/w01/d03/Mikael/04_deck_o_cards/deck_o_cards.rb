def deck_o_cards
  values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  suits = ['hearts', 'diamonds', 'clubs', 'spades']

  # ... build your deck ...

  deck = []

  values.each do |i|
    suits.each do |j|
      deck.push({i => j})
    end
  end
  return deck.shuffle
end

deck_o_cards

puts "The deck has #{deck.length} cards"
top = deck.pop()
puts "The top card is the #{top[0][0]} of #{top[0][1]}"
