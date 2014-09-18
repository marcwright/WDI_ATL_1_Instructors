def solution(k, numbers)
  # count the number of pairs of integers whose difference is k
  result = 0
  i = 0
  while i < numbers.length - 1
    result += 1 if ((numbers[i] - numbers[i+1]).abs == k)
    i += 1
  end
  result
end
