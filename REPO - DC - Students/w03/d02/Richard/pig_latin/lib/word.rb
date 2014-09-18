class Word

  attr_accessor :vowels, :cons

  def initialize(original_word)
    @original_word = original_word
    @vowels = ['a', 'e', 'i', 'o', 'u']
    @cons = ('a'..'z').to_a - @vowels
  end

  def original_word
    return @original_word.downcase
  end

  def piglatin_converter
    if vowels.include?(original_word[0])
      return original_word.capitalize + "way"
    elsif cons.include?(original_word[0]) && cons.include?(original_word[1])
      original_word.capitalize[2..-1] + original_word[0..1] + 'ay'
    elsif cons.include?(original_word[0]) && vowels.include?(original_word[1])
      original_word[1..-1] + original_word[0] + 'ay'
    end
  end
end
