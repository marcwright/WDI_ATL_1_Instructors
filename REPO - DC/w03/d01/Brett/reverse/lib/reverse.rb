def reverse_words(phrase)
  phrase.split(" ").reverse.join(" ")
end

def reverse_each_word(phrase)
  phrase.split(" ").map { |word| word.reverse }.join(" ")
end
