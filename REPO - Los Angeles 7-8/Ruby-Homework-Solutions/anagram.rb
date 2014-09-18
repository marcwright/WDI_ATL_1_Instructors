def solution s
  h = Hash.new
  s.chars.uniq.each { |x| h[x] = s.count(x).even? }
  h.values.count(false) <= 1 ? 1 : 0
end
