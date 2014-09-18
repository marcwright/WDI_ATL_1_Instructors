
def reverse_words(word)
  return word.split(' ').reverse.join(" ")

end


def reverse_each_word(word)
  word.reverse.split(" ").reverse.join(" ")
end
