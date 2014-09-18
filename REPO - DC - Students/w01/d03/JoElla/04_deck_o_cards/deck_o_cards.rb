def deck_o_cards
  values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  suits = ['hearts', 'diamonds', 'clubs', 'spades']

  deck = []

  suits.each do |s|
    values.each do |v|
      deck.push({
        suit: s,
        values: v
        })
    end
  end
  # ... build your deck ...
  return deck.shuffle
end


puts deck_o_cards()



