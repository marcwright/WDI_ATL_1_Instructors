require 'pry'
require 'prime'

def drinking_age?(age)
  if age < 21
    puts "Underage!"
    return false
  else
    puts "Drink!"
    return true
  end
end

def ac_action(current_temp, ac_functional, desired_temp)
  if ac_functional == "y" && current_temp > desired_temp
  return "Turn on the AC please"

  elsif ac_functional == "n" && current_temp > desired_temp
    return "Fix the AC now!"

  elsif ac_functional == "n" && current_temp < desired_temp
    return "Fix the AC whenever you have the chance... it's cool..."

  else
    return "No need for AC right now."

  end
end

def is_prime?(integer)
  return integer.prime?
end

binding.pry
