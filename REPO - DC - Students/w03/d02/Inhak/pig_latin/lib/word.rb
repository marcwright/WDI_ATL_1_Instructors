class Word
  attr_reader :vowels, :alphabet, :consonants
  def initialize(original_word)
    @original_word = original_word
    @@alphabet = ('a'..'z').to_a
    @vowels = ["a","e","i","o","u"]
    @consonants = @@alphabet - @vowels
  end

  def original_word
    return @original_word.downcase
  end

  def piglatinize
    if @vowels.include?(@original_word[0])
      return @original_word + "way"
    elsif @consonants.include?(@original_word[1])
      return @@alph
    else
      @original_word = @original_word.split(//)
      first_letter = @original_word.shift
      return @original_word.push(first_letter).join + "ay"
    end
  end
end
