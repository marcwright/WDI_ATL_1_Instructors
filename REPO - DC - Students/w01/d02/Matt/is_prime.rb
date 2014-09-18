def is_prime?(num)
  factor = 2
  max_potential_factor = num / 2
  while factor <= max_potential_factor
    if (num % factor) == 0
      return false
    end
    factor += 1
  end
  return true
end

puts "Give me a number to test"
a = gets.to_i

if is_prime?(a)
  puts "No good"
else
  puts "it may work"
end
