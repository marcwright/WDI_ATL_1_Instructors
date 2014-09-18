class Cipher

  @@alphabet = ("a".."z").to_a
  @@cipher = ("a".."z").to_a.concat(("a".."m").to_a)

  def self.encode(message)

    message_array = message.downcase.chars

    encoded_array = message_array.map do |letter|
      @@cipher[@@alphabet.index(letter)]
    end

    encoded_array.join

  end

  # def self.decode

  # end

end
