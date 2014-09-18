def reverse_words(sentence)
  sentence_array = sentence.split(" ")
  sentence_array.reverse.join(" ")
end

def reverse_each_word(sentence)
  sentence_array = sentence.split(" ")
  sentence_array.map do |word|
    word.reverse!
  end
  sentence_array.join(" ")
end
