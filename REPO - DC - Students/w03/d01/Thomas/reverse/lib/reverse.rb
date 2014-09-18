def reverse_words(string)
  verse = string.split(" ")
  verse.reverse.join(" ")
end

def reverse_each_word(string)
  # string.split.map {|word| word.reverse}.join(" ")
  verse = string.reverse.split(" ")
  verse.reverse.join(" ")
end
