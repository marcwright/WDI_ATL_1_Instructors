require 'pry'

def drinking_age?(age)
  if age < 21
    puts "You are not old enough to (legally) drink yet."
    return false
  else
    puts "Congratulations, you can (legally) drink!"
    return true
  end
end

def ac_action(current_temp, functional, desired_temp)
  functional.downcase
  if functional == "yes" && current_temp > desired_temp
    return "Turn on the A/C please."
  elsif functional == "no" && current_temp > desired_temp
    return "Fix the A/C now! It's hot!"
  elsif functional == "no" && current_temp < desired_temp
    return "Fix the A/C whenever you have the chance... It's cool..."
  else
    return "I'm comfortable."
  end
end

def is_prime?(number)
  factor = 2
  max_potential_factor = num/2
  while factor <= max_potential_factor
    if (num%factor)==0
      return false
    end
    factor += 1
  end

  return true
end


