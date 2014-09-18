# require 'pry'

class ScrabbleWord

  def initialize(word)
    @word = word
    @letter_values = { a: 1, b: 3, c: 3, d: 2, e: 1, f: 4, g: 2, h: 4, i: 1, j: 8, k: 5, l: 1, m: 3, n: 1, o: 1, p: 3, q: 10, r: 1, s: 1, t: 1, u: 1, v: 4, w: 4, x: 8, y: 4, z: 10 }
  end

  def word
    return @word.downcase
  end

  def letter_values
    return @letter_values
  end

  # returns a numeric score for the scrabble word
  def score

    point_values = word.chars.map do |letter|
      letter_values[letter.to_sym]
    end
    return point_values.reduce(:+)

    # @score = 0
    # word.each_char do |char|
    #   @score += get_values(char)
    # end
    # return @score

    # word.chars.reduce(0) do |total, char|
    #   total += get_values(char)
    # end

  end

  # def get_values(letter)
  #   letter_values = { a: 1, b: 3, c: 3, d: 2, e: 1, f: 4, g: 2, h: 4, i: 1, j: 8, k: 5, l: 1, m: 3, n: 1, o: 1, p: 3, q: 10, r: 1, s: 1, t: 1, u: 1, v: 4, w: 4, x: 8, y: 4, z: 10 }
  #   return letter_values[letter.to_sym]
  # end


  def multiplier_score(multiplier)
    return score * multiplier
  end

end


# binding.pry
