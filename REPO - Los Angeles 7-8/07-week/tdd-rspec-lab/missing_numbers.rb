def solution(array1, array2)
  # this is Kyle Riach's solution
  answer = []
  frequencies = Hash.new(0)
  frequencies2 = Hash.new(0)
  array1.each { |l| frequencies[l] += 1 }
  array2.each { |l| frequencies2[l] += 1 }
  frequencies.each do |k,v|
    if frequencies2[k] != frequencies[k]
      answer << k
    else
    end
  end
  return answer
end
