
def reverse_words(string)
  string.split(" ").reverse.join(" ")
end

def reverse_each_word(string)
  words = string.split(" ")
  (words.map { |word| word.reverse }).join(" ")

end
