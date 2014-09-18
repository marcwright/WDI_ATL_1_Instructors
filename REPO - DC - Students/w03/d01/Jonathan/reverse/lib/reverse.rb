



# def initialize(string)
#   @string = string
# end

# def string
#   return @string
# end

def reverse_words(string)
  string.split(" ").reverse.join(" ")
end

def reverse_each_word(string)
  string.split(" ").map { |w| w.reverse }.join(" ")
end
