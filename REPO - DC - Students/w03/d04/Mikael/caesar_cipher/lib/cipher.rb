class Cipher
  @@alphabet = ('a'..'z').to_a

  @@cipher = ('n'..'z').to_a.concat(('a'..'m').to_a)

  def self.encode(message)
    message.split("")
  end
end
