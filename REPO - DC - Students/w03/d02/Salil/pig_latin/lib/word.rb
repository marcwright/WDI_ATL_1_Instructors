require 'pry'

class Word
  def initialize(original_word)
    @original_word = original_word
  end

  def original_word
    return @original_word.downcase
  end

  def piglatinize
    char = @original_word.chr
    if  char == "a" || char == "e" || char == "i" || char == "o" || char == "u"
      @original_word = @original_word + "way"
      return @original_word
    else
     @original_word = @original_word.reverse.chop.reverse
     @original_word = @original_word + char + "ay"
   end
  end
end


