def deck_o_cards
  values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  suits = ['hearts', 'diamonds', 'clubs', 'spades']

  deck = []

  values.each do |v|
    suits.each do |s|
      deck.push({
        value: v,
        suit: s
        })
    end
  end
  return deck.shuffle# ... build your deck ...
end

puts deck_o_cards()
