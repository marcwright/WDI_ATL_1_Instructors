class Word

  attr_reader :original_word

  def initialize(original_word)
    @original_word = original_word
  end

  def original_word
    return @original_word.downcase
  end

  def piglatinize
    if original_word[0].chr == "a" || "e" || "i" || "o" || "u"
      return original_word + "way"
    elsif original_word[1].chr == "a" || "e" || "i" || "o" || "u"
      return original_word + "day"
    else
    return false
   end

  ## Regex way to do it
  # def piglatinize
  #   case original_word.chr
  #   when "a", "e", "i", "o", "u" then original_word + "way"
  #   else
  #     original_word.sub(/^([^aeiou]+)(.+)/, '\2\1ay')
  #   end
  # end

  ## Bonus to find y words
   # ['y', 'squ', 'qu'].each do |pattern|
   #    if original_word.start_with?(pattern)
   #      pattern.length.times { orig_copy.shift }
   #      return orig_copy.join + pattern + "ay"
   #  end

  end
end
