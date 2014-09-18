

def deck_o_cards
  values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  suits = ['hearts', 'diamonds', 'clubs', 'spades']
  deck = []

  suits.each do |v| # loop through all values and assume entity v
    values.each do |s| # loop through all suits and assume entity s
          deck.push({value: v, suit: s})
          # add value and suit hash to deck array.
    end
  end
  return deck.shuffle
end

puts deck_o_cards
