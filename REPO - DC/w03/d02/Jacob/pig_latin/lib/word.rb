class Word
  def initialize(original_word)
    @original_word = original_word
  end

  def original_word
    return @original_word.downcase
  end

  def alphabet
    return ("a".."z").to_a
  end

  def vowels
    return ["a", "e", "i", "o", "u"]
  end

  def consonants
    return alphabet - vowels
  end

  def vowel?
    if vowels.include?(original_word[0])
      return original_word + "way"
    end
  end

  def consonant?
    if consonants.include?(original_word[0] && original_word[1])
      return original_word[2..-1] + original_word[0..1] + "ay"
    elsif consonants.include?(original_word[0] && !original_word[1])
      return original_word[1..-1] + original_word[0] + "ay"
    end
  end

end

#Michael's version
def piglatinize
  if vowels.include?(original_word[0])
    return original_word + "way"
  else
    construct = original_word.split(//)
    while consonants.include?(construct[0])
      construct.push(construct.shift)
      break if contruct[0] == "y"
    end
    return construct.join + "ay"
  end
end



