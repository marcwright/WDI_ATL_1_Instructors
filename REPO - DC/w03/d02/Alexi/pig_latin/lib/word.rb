# class Word
#   def initialize(original_word)
#     @original_word = original_word
#   end

#   def original_word
#     return @original_word.downcase
#   end
# end

class PigLatin
  def initialize(word)
    @word = word.downcase
  end

  def pig_vowel
    pig_latin = @word + "way"
    return pig_latin
  end

  # This needs to determine whether or not consonants
  # exist at the beginning, and then capture all consonants 
  # until a vowel is encountered. Those consonants must
  # then be removed and appended to the end of the word.
  def pig_consonant
    pig_latin = @word

end # END of PigLatin Class
