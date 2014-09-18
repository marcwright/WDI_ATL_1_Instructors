
class Cipher

  def self.encode(word)
    alpha = ('a'..'z').to_a
    letter_array = word.split(//)
    encoded_array = letter_array.map do |letter|

      alpha.each_with_index do |bit, index|
        if bit == letter && (alpha.index(bit) + 13) > 28
              return alpha[(index+13) - 28]
        elsif (alpha.index(bit) + 13) <= 28
              return alpha[index+13]
        end #end if
        end #end do #2
      end #end do #1

  end #End def encode

end #End class
