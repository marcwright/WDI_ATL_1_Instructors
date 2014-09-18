


def reverse_words(words)
words.split.reverse.join(' ')

end

def reverse_each_word(words)
  new_words = words.split.map {|word| word.reverse}.join(' ')
  # newer_words = new_words.join(" ")
end

