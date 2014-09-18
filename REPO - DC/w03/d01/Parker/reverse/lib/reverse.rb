# class Reverse
	
# 	def initialize(reverse_words, reverse_each_words)
# 		@reverse_words = reverse_words
# 		@reverse_each_words = reverse_each_words
# 	end

# 	def reverse_words
# 		return @reverse_words.reverse
# 	end

# 	def reverse_each_words
# 		return @reverse_each_words.reverse.reverse
# 	end
# end


	
def reverse_words(string)
	string.split (" ").reverse.join(" ")
end

def reverse_each_word(string)
	return string.split(" ").map { |w| w.reverse }.join(" ")
end


