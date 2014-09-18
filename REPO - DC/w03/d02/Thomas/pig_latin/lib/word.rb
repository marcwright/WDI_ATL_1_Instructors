require 'pry'

class Word
  def initialize(original_word)
    @original_word = original_word
  end

  def original_word
    return @original_word.downcase
  end

  def piglatinize(word)
    vowels = ["a", "e", "i", "o", "u"]
    if vowels.include?(word[0])
      return word + "way"
    else
      frontal = word[0]
      return word.delete(frontal) + frontal + "ay"
    end
  end

#stephens code:

    ['y', 'squ', 'qu'].each do |pattern|
      if original_word.start_with?(pattern)
        pattern.length.times { orig_copy.shift }
        return orig_copy.join + pattern + "ay"
    end


end


