# class Word
#   def initialize(original_word)
#     @original_word = original_word
#     @vowels = ["a","e","i","o","u"]
#     @consonants = ["b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","z"]
#   end

#   def original_word
#     return @original_word.downcase
#   end

#   def piglatinize
#     if @vowels.include?(@original_word[0])
#       return @original_word + "way"
#     else
#       original_word_array = @original_word.split("")
#       letter = 0
#       while @consonants.include?(original_word_array[0])
#         original_word_array.push(original_word_array.shift)
#       end
#         original_word_array.join + "ay"

#     end
#   end
# end

#regex example:

# class Word
#   def initialize(original_word)
#     @original_word = original_word
#   end

#   def original_word
#     return @original_word.downcase
#   end

#   def piglatinize
#     case @original_word.chr
#     when "a", "e", "i", "o", "u" then original_word + "way"
#     else
#       original_word.sub(/^([^aeiou]+)(.+)/, '\2\1ay')
#     end

#   end
# end
