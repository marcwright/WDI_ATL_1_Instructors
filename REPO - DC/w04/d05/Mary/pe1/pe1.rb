# num = 1
# multiples_array = []
# while num < 1000
#   if num % 3 == 0
#     multiples_array.push(num)
#   elsif num % 5 == 0
#     multiples_array.push(num)
#   end
#   num += 1
# end
# puts multiples_array.reduce(:+)

def sum_multiples(multiple, to)
    n = (to-1) / multiple
    n * (n+1) / 2 * multiple
end

puts sum_multiples(3,1000) + sum_multiples(5,1000) - sum_multiples(15,1000)
