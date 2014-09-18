require 'pry'

class Word

  attr_reader :vowels, :consonants

  def initialize(original_word)
    @original_word = original_word
    @vowels = ["a", "e", "i", "o", "u", "y"]
    @consonants = ('a'..'z').to_a - @vowels

  end

  def original_word
    return @original_word.downcase
  end

  def pig_latinize




    case original_word.chr
    when "a", "e", "i", "o", "u" then original_word + "way"
    else
      original_word.sub(/^([^aeiou]+)(.+)/, '\2\1ay')
    end
  end
end #END Word
