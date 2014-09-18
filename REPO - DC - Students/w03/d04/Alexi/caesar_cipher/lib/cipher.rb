require 'pry'

class Cipher  
  @@alphabet = ('a'..'z').to_a
  @@cipher = @@alphabet.rotate(13)

  def self.encode(message)

    # message_array = message.downcase.chars    

    # encoded_array = message_array.map do |letter|
    #   @@cipher[@@alphabet.index(letter)]
    # end
    cipher_hash = @@alphabet.zip(@@cipher)
    encoded = message.chars.map do |char|
      cipher_hash[char]
    end

    return encoded.join


  end
end

Cipher.encode("Alexi")
