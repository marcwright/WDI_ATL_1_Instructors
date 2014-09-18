require 'pry'

class Cipher
  @@alphabet = "a-zA-Z"
  @@cipher = "n-za-mN-ZA-M"

  def self.encode(message)
    message.tr( @@alphabet, @@cipher )
  end

  def self.decode(message)
    message.tr( @@cipher, @@alphabet )
  end
end
