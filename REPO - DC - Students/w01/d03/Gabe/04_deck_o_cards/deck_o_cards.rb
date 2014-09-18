def deck_o_cards
  values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  suits = ['hearts', 'diamonds', 'clubs', 'spades']

deck = Hash.new
deck = {}

values.each do |kind| suits.each 
				do |suit| deck.push({kind: values, suit: suits})
				end
			end


return deck.shuffle  
end

puts deck_o_cards

#DOES NOT WORK dont know why