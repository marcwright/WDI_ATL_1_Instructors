require 'pry'

class Word
  def initialize(original_word)
    @original_word = original_word
    @vowels = ['a', 'e', 'i', 'o', 'u']
    @consonants = Array('a'..'z') - ['a', 'e', 'i', 'o', 'u']
  end

  def original_word
    return @original_word.downcase
  end

  def piglatinize
    if original_word[0] == "a" || "e" || "i" || "o" || "u"
      original_word + "way"
    else
      #iterate through original word until first vowel
      #shift the values into an array
      #while loop
      character_array = original_word.split(//)
      while consonants.include?(character_array[0])
        # binding.pry
        character_array << character_array.shift
      end
      return character_array.join + "ay"
      #For words that begin with consonant sounds, the initial consonant or consonant cluster is moved to the end of the word, and "ay" is added.
    end
  end
end
