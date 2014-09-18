
def deck_o_cards
  values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  suits = ['hearts', 'diamonds', 'clubs', 'spades']
  deck = []

  values.each do |val|
    suits.each do |suit|
      deck.push({
        value: val,
        suit: suit
        })
    end
  end

puts deck.shuffle
end

deck_o_cards
