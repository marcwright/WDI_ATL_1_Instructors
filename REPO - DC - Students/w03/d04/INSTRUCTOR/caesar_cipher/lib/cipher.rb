class Cipher


### THANKS ALEXI
  def self.encode(message)
    # Transpose the alphabet into an array
    @@alphabet = ('a'..'z').to_a
    # Quickly generate the 13+ alphabet (array)
    @@cipher = @@alphabet.rotate(13)
    # Create a hash out of the two arrays
    cipher_hash = Hash[@@alphabet.zip(@@cipher)]
    # Iterate over the |message| and return an enciphered word
    encoded = message.chars.map do |char|
      cipher_hash[char]
    end
    return encoded.join
  end



### THANKS STEPHEN  
  # def self.encode(message)
  #   return message.chars.map { |char| ((char.ord - 96 + 13) % 26 + 96).chr }.join
  # end

### THANKS MARY
  # def self.encode(message)
  #   # array of the alphabet
  #   alphabet = ('a'..'z').to_a

  #   # array of the rotated alphabet
  #   cipher = ('n'..'z').to_a.concat(('a'..'m').to_a)

  #   # array version of the message
  #   message_array = message.downcase.chars

  #   # find the index of each letter in the normal alphabet of the message
  #   # new array: use the same index to look up the letter in the rotated alphabet
  #   encoded_array = message_array.map do |letter|
  #     cipher[alphabet.index(letter)]
  #   end  

  #   # join the new array
  #   encoded_array.join
  # end

end
