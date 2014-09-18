require "pry"

class Cipher
  # create ROT13 cipher and set as class variables
  alpha_pattern = [Array("a".."z"), Array("A".."Z")]                    # nested array of lower & uppercase alphabets
  rot13_cipher = alpha_pattern.map { |alphabet| alphabet.rotate(13) }   # each letter in the alphabet is shifted 13 chars
  @@alphabet = alpha_pattern.join
  @@cipher = rot13_cipher.join

  def self.encode(string)
    string.tr(@@alphabet, @@cipher)
  end

  def self.decode(string)
    string.tr(@@cipher, @@alphabet)
  end
end
