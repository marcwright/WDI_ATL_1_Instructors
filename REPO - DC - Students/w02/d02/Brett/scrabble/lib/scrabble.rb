require 'pry'

class ScrabbleWord

@@letter_values = { a: 1, b: 3, c: 3, d: 2, e: 1,
  f: 4, g: 2, h: 4, i: 1, j: 8,
  k: 5, l: 1, m: 3, n: 1, o: 1,
  p: 3, q: 10, r: 1, s: 1, t: 1,
  u: 1, v: 4, w: 4, x: 8, y: 4,
  z: 10}

  def initialize(word)
    @word = word
    @score = 0
  end

  def multiplier
    return @multiplier
  end

  def word
    return @word.downcase
  end

  def score
    @score = word.chars.reduce(0) { |sum, character| sum + @@letter_values[character.to_sym] }
    return @score
  end

  # def multiplier_score(multiplier)
  #   return score * multiplier
  # end

end

puts "Enter word:"
answer = gets.chomp
word = ScrabbleWord.new(answer)
puts "The score is #{word.score}"
