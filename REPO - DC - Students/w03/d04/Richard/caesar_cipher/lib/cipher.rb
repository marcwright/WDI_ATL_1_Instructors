require 'pry'

class Cipher
  attr_accessor :cipher, :alpha

def initialize
end

def self.encode(word)
  alpha = ("a".."z").to_a
  cipher = alpha[13..25]+alpha[0..12]

  word.split(" ").map do |word|
    word.chars.map do |letter|
      cipher[alpha.index(letter)]
    end.join
  end.join(" ")

end

end
