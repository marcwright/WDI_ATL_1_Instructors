require 'pry'

# CREATE SCRABBLEWORD CLASS
class ScrabbleWord
  def initialize(word)
  	@word = word
  end

 # GETTER METHOD FOR @WORD VARIABLE
  def word
  	return @word.downcase
  end


def letter_score_returner(letter)
		letter_score_hash = {
  a: 1, 
  b: 3, 
  c: 3, 
  d: 2, 
  e: 1,
  f: 4, 
  g: 2, 
  h: 4, 
  i: 1, 
  j: 8,
  k: 5, 
  l: 1, 
  m: 3, 
  n: 1, 
  o: 1,
  p: 3, 
  q: 10, 
  r: 1, 
  s: 1, 
  t: 1,
  u: 1, 
  v: 4, 
  w: 4, 
  x: 8, 
  y: 4,
  z: 10}
  return letter_score_hash[letter.to_sym] 
end





 # SCORE METHOD
	def score_calculator(word)

		letters_of_input_word_array = []
 	
		letters_of_input_word_array= word.split("")
 		
		array_of_letter_scores = letters_of_input_word_array.each {|a_letter| letter_score_returner(a_letter)}
 	
 		puts array_of_letter_scores
	end

end

	

