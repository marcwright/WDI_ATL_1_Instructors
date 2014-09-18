# slow
=begin
def solution(a)
  (1..100000).each do |x|
    if !a.include?x
      return x
    end
  end
end
=end


# much quicker!!!
def solution(a)
  a.sort!
  begin
    a.each.with_index { |k, index| return  a[index]+1 if (a[index+1] - a[index]) > 1 }
  rescue NoMethodError
    return a.last + 1
  end
end



# manual testing
x = (1..100000).to_a.shuffle
start = Time.new
#puts solution([1, 3, 6, 4, 1, 2])
puts solution(x)
puts Time.new - start
