def deck_o_cards
  values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  suits = ['hearts', 'diamonds', 'clubs', 'spades']
  deck = []

  values.each do |v|
    suits.each do |s|
      deck.push({
        value: v,
        suits: s
        })
    end
  end
  return deck.shuffle
end

deck_o_cards()
puts "The deck has cards"
puts "The top card is the of "
