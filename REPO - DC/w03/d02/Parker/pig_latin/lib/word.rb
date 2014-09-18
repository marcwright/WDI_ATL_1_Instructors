class Word
  def initialize(original_word)
    @original_word = original_word
    @vowel_word = vowel_word
    vowel_word = original_word
  end

  def original_word
    return @original_word.downcase
  end

  def vowel_word 
  	vowel_word %w= (a e i o u)
	return original_word 
 end


end


