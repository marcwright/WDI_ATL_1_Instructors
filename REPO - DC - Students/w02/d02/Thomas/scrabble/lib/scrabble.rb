
score = []

class ScrabbleWord
  def initialize(word)
    @word = word
  end

  def word
    return @word.downcase
  end

  #returns the scrabble score of the word
  #what does typing "word" below accomplish?
  def score
    #solution one
    # @score = 0
    # word.each_char do |char|
    #   @score += get_value(char)
    # end
    # return @score

    #solution two
    # word.chars.reduce(0) do |total, char|
    #   total + get_value(char)
    # end

    #solution three
    letter_values = {a:1, b:3, c:3, d:2, e:1, f:4, g:2, h:4, i:1, j:8, k:5, l:1, m:3, n:1, o:1, p:3, q:10, r:1, s:1, t:1, u:1, v:4, w:4, x:8, y:4, z:10}
    point_values = word.chars.map do |letter|
      letter_values[letter.to_sym]
    end
    point_values.reduce(:+)
  end

  def get_value(letter)
    letter_values = {a:1, b:3, c:3, d:2, e:1, f:4, g:2, h:4, i:1, j:8, k:5, l:1, m:3, n:1, o:1, p:3, q:10, r:1, s:1, t:1, u:1, v:4, w:4, x:8, y:4, z:10}
    return letter_values[letter.to_sym]
  end

  #multiplier as an argument and returns a multiplied value of the score
  def multiply_score(factor)
    score * factor
    return score
  end
end

new_word = ScrabbleWord.new("dog")
puts new_word.score
