class Cipher

  def self.encode(word)

    word.chars.map { |char| ((char.ord - 96 + 13) % 26 + 96).chr }.join


    # alphabet = ('a'..'z').to_a
    # cipher = ('n'..'z').to_a.concat(('a'..'m').to_a)

    # word_array = word.downcase.chars
    # new_word = word_array.map do |letter|
    #   cipher[alphabet.index(letter)]
    # end # .each
    # return new_word.join

  end # self.encode

end
