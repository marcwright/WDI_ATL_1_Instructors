require 'pry'

def word_ladder_neighbors(input_word)
  word_array = ["blue", "rain"]
  # stop if word is not four letters

  # split the word
  split_word = input_word.split(//)
  # iterate through the word array
  matches = word_array.each do |word|
    possible_match = word.split(//)
    matched_letters = split_word & possible_match
    binding.pry
    matches << word if matched_letters.length == 3
  end
  matches
end

def four_letters?(word)
  return true if word.length == 4
  false
end


binding.pry
