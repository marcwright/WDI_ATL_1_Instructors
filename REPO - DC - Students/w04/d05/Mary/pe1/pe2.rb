fib_array = [1,2]
num = 1
while num < 4000000
  num = fib_array[-1] + fib_array[-2]
  fib_array.push(num)
end
even_fib_array = fib_array.select do |num|
  num % 2 == 0
end
puts even_fib_array.reduce(:+)
