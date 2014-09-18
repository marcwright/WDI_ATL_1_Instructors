require 'pry'
class Cipher

  def self.encode(message)

    letters = message.chomp.split("")


    13.times {letters.each { |letter| letter.succ! }}




    letters.join

  end

end
