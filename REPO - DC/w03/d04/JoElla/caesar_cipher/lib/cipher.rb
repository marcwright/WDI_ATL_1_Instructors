class Cipher

  def self.encode(word)
    alpha = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v
      ","w","x","y","z"]
    word_arr = word.split("")
    code_index_arr = word_arr.map do |letter|
      index_num = alpha.index(letter)
        if index_num > 13
          new_index = (index_num + 13) - 26
        else
          new_index = index_num + 13
        end
    end
    new_letter_array = code_index_arr.map do |index|
      coded_index = alpha[index]
    end
    new_letter_array.join("")
  end

end


#get index of each letter in reg alphabet
#add 13 to that number
#return the letter in that position
