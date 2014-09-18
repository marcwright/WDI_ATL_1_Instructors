def reverse_words(string)
  string.split.reverse.join(" ")
end

def reverse_each_word(string)
  string.split.map do |word|
    word.reverse
  end.join(" ")
end
