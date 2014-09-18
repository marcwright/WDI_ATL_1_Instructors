require 'pry'

class Cipher

  def initialize
  end

  def self.encode(word)
    alphabet = ("a".."z").to_a
    word_array = word.split(//)
    new_array = []
    word_array.each do |letter|
      index = alphabet.index(letter)
      if index <= 12
        new_array.push(alphabet[index + 13])
      elsif index > 12
        new_array.push(alphabet[index - 13])
      end
    end
      new_word = new_array.join
      return new_word
  end
end


