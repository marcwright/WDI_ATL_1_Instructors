def solution(n)
  (result = n.to_s.scan(/\w/).sort.reverse.join.to_i) <= 100000000 ? result : -1
end
