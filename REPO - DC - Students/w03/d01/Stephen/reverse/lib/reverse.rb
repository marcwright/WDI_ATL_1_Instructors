# Stephen Stanwood (stephen@stanwoodsolutions.com)

# Reverses the order of words in a given sentence/list
def reverse_words(sentence)
  return sentence.split(" ").reverse.join(" ")
end

# Reverses each individual word in a given sentence/list
def reverse_each_word(sentence)
  return (sentence.split.map { |w| w.reverse }).join(" ")
end
