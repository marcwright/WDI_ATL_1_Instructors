require 'pry'

def drinking_age?(age)
  if age < 21
    puts "You are too young to drink!"
    return false
  else
    puts "Drink away!"
    return true
  end
end

def ac_action(temp, functional, wish_temp)
  if functional == "yes" && temp > wish_temp
    return "Turn on the A/C please"
  elsif functional == "no" && temp > wish_temp
    return "Fix the A/C now! It's hot!"
  elsif functional == "no" && temp <= wish_temp
    return "Fix the A/C whenever you have the chance...  It's cool..."
  end
end

def is_prime?(num)
  if num.to_i / 2 % 0 || num.to_i / 3 % 0 || num.to_i / 5 % 0
    return false
  else
    return true
  end
end

binding.pry
