def deck_o_cards
  values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  suits = ['hearts', 'diamonds', 'clubs', 'spades']
  deck = []
  	
  	values.each{|value|
  		suits.each{|suit|
  			deck.push({
  				value: value,
  				suit: suit
  			})
  		}
  	}

return deck.shuffle
  # ... build your deck ...
  
end
puts deck_o_cards()