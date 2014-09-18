require 'pry'

class Cipher
  def self.encode(word)
    alphabet = Array('a'..'z')
    reverse_alphabet = alphabet[13..26] + alphabet[0..12]
    word.split(" ").map{
      |word| word.chars.map { |letter| reverse_alphabet[alphabet.index(letter)] }.join
    }.join(" ")
  end
end
