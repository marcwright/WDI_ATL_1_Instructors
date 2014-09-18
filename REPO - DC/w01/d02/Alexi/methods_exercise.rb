require 'pry'

def drinking_age?(age)
  if age < 21
    puts "You are underage"
    return false
  else
    puts "You can drink."
    return true
  end
end

# drinking_age?(19)
# drinking_age?(23)

def ac_action(temp, functional, desired_temp)
  functional.downcase
  if functional == "yes" && temp > desired_temp
    return puts "Turn on the A/C"
  elsif functional == "no" && temp > desired_temp
    return puts "Fix A/C now!"
  elsif functional == "no" && temp < desired_temp
    return puts "Fix A/C at your convenience."
  else
    return "copacetic"
  end
end

# var1(65, "yes", 70)
# var2(65, "no", 70)
# var3(65, "yes", 60)

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

binding.pry

# if is_prime?(9)
#   puts "Broken"
# else
#   puts "9 is not prime!"
# end
