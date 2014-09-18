
require "pry"

  class Word

  	attr_reader :vowels, :consonants
  	def initialize(original_word)
  		@original_word = original_word
  		@vowels = ["a", "e", "i", "o", "u"]
  		@consonants = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]

  	end

  	def original_word
  		return @original_word.downcase
  	end

  	def piglatinize
  		if vowels.include?(original_word[0])
  			return original_word + "way"
  		else
  			construct = original_word.split(//)
  			while consonants.include?(construct[0])
  				construct.push(construct.shift)
  			end
  			return construct.join + "ay"
  		end
  	end

  	
end

 #def piglatinize  #--a method using REGEX...
 #   case original_word.chr
 #   when "a", "e", "i", "o", "u" then original_word + "way"
 #   else
 #     original_word.sub(/^([^aeiou]+)(.+)/, '\2\1ay')
 #   end
 #end


 #['y', 'squ', 'qu'].each do |pattern|    #---y, qu, and squ method
 #     if original_word.start_with?(pattern)
 #       pattern.length.times { orig_copy.shift }
 #       return orig_copy.join + pattern + "ay"
 #   end