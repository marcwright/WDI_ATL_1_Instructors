def deck_o_cards
  deck = []

  values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  suits = ['hearts', 'diamonds', 'clubs', 'spades']

  # ... build your deck ...
  suits.each do |s|
    values.each do |v|
      deck.push({suit: s, value: v})
    end
  end

  return deck.shuffle
end

deck = deck_o_cards
puts "The deck has #{deck.size} cards."
puts "The top card is the #{deck[0][:value]} of #{deck[0][:suit]}."
