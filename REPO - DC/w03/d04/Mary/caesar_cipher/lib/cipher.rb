class Cipher

  def self.encode(word)
    alphabet = ('a'..'z').to_a
    #can also use alphabet.rotate(13)
    cipher = ('n'..'z').to_a.concat(('a'..'m').to_a)
    word_array = word.downcase.chars
    new_word_array = word_array.map do |letter|
      cipher[alphabet.index(letter)]
    end
    new_word_array.join
  end
end
