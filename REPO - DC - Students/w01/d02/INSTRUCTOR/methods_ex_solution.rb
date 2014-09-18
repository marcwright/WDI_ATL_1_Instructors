require 'pry'

def drinking_age?(age)
  if age < 21
    puts "You can't drink yet...legally."
    return false
  else
    puts "Libations galore!"
    return true
  end
end

drinking_age?(19)
drinking_age?(23)

def ac_action(curr_temp, functional, ideal_temp)
  functional.downcase
  if functional == "yes" && curr_temp > ideal_temp
    return "Turn on the AC please"
  elsif functional == "no" && curr_temp > ideal_temp
    return "Fix the A/C... It's getting hot in here!"
  elsif functional == "no" && curr_temp < ideal_temp
    return "Fix the A/C whenever you want, it's cool"
  else
    return "everything is good with the climate"
  end
end

var1 = ac_action(70, "yes", 68)
var2  = ac_action(69, "no", 80)
third = ac_action(80, "no", 75)


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


if is_prime?(9)
  puts "This method breaks the world."
else
  puts "it might still work"
end

binding.pry












