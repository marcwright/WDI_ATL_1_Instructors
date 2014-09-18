# ## Deck o' Cards

# Time for a game… but first we'll need a deck of playing cards. Use `deck_o_cards.rb` as a starting point for this exercise.

# 1. Make `deck_o_cards` assemble an array of cards using the provided *suits* and *values* arrays. Each card in the deck should be a hash formatted as:
#   * `{suit: 'hearts', value: 'A'}`
# 2. Make `deck_o_cards` return a shuffled array of cards.
# 3. Call `deck_o_cards`, then print the following:
#   * **"The deck has {n} cards"**
#   * **"The top card is the {value} of {suit}"**

# def deck_o_cards
  suits = ['hearts', 'diamonds', 'clubs', 'spades']
  values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  # build a deck of cards based on possible suit and card values
  deck = []
  suits.each do |suit_name|
    values.each { |card_val| deck << Hash[:suit, suit_name, :value, card_val] }
  end

  deck.shuffle!

  puts "Our deck has #{deck.length} cards."
  top_card = deck[0]
  puts "The top card is the #{top_card[:value]} of #{top_card[:suit]}."
end

deck_o_cards
