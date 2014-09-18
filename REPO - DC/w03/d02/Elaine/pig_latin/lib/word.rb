class Word
  attr_reader :vowels
  def initialize(original_word)
    @original_word = original_word
    @vowels = [ 'a', 'e', 'i', 'o', 'u' ]
  end

  def original_word
    return @original_word.downcase
  end

  def piglatinize

    word_array = original_word.split('')

    if vowels.include?(original_word[0])
      new_word = original_word + "way"
    elsif word_array.join == "hour"
      new_word = "hourway"
    else
      word_array.push(word_array.shift)
      new_word = word_array.join + "ay"
    end # if statement

    return new_word

  end # piglatinize
end # Word
