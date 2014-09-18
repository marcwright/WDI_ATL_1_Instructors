def deck_o_cards
  values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  suits = ['hearts', 'diamonds', 'clubs', 'spades']

  # ... build your deck ...

  deck = []
  values.each do |s|
    suits.each do |v|
      deck.push{
        value: s,
        suit: v
      }
    end
  end

  return deck.shuffle
end

puts deck_o_cards()
