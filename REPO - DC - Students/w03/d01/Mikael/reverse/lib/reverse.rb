def reverse_words(sentence)
  return sentence.split.reverse.join(" ")
end

def reverse_each_word(sentence)
  words = sentence.split
  words.map! do |word|
    word.reverse
  end
  return words.join(" ")
end
