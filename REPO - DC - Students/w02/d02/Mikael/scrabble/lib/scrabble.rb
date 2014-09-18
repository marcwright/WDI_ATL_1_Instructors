class ScrabbleWord
  def initialize(word)
    @word = word
    @values = { a: 1, b: 3, c: 3, d: 2, e: 1, f: 4, g: 2, h: 4, i: 1, j: 8, k: 5, l: 1, m: 3, n: 1, o: 1, p: 3, q: 10, r: 1, s: 1, t: 1, u: 1, v: 4, w: 4, x: 8, y: 4, z: 10 }
  end

  def word
    return @word.downcase
  end

  def values
    return @values
  end

  def score
    @score = 0

    # word.chars do |c|
    #   @score += @values[c.to_sym]
    # end

    # return @score

    word.chars.reduce(0) do |total, char|
      total + values[char.to_sym]
    end
  end

  def multiplier_score(multiplier)
    return score * multiplier
  end

end
