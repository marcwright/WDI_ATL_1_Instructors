def drinking_age(age)
  if age < 21
    puts "#{age}-year-olds cannot drink legally!"
    return false
  end

  puts "#{age}-year-olds are good to go!"
  return true
end

def ac_action(curr_temp, ac_works, des_temp)
  if ac_works
    if curr_temp > des_temp
      return "Turn on the A/C Please"
    end
  else
    if curr_temp > des_temp
      return "Fix the A/C now!  It's hot!"
    else
      return "Fix the A/C whenever you have the chance...  It's cool..."
    end
  end

  return "ERROR"
end

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

puts "###1. Drinking age"
drinking_age(18)
drinking_age(21)
drinking_age(25)
puts ""

puts "###2. Air Conditioning"
puts ac_action(75, true, 72)
puts ac_action(75, false, 72)
puts ac_action(75, false, 80)
puts ""

puts "###3.  Prime Numbers"
if is_prime?(5)
  puts "==> 5 is prime"
end

if is_prime?(8)
  puts "==> 8 is prime"
end

if is_prime?(2)
  puts "==> 2 is prime"
end
