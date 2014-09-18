def add(a, b)
  return a + b
end

def odds(numbers)
  return numbers.select do |num|
    num.odd?
  end
end

def palindrome?(word)
  uniform = word.downcase.strip
  return uniform == uniform.reverse && uniform.size > 1
end