

def reverse_words(words)
  return words.split(' ').reverse().join(' ')
end


def reverse_each_word(words)
  # return words.split(" ").map { |word| word.reverse}.join(" ")
  return words.reverse.split(' ').reverse().join(' ')
end
