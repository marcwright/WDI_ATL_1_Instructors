require 'pry'
require 'prime'
def drinking_age(age)
  if age.to_i < 21
    puts "You are too young for this noms."
    return false
  else
    puts "Enjoy the Brew!"
    return true
  end
end

def ac_action(current_temp, working_ac, ideal_temp)
  if working_ac.downcase == "yes" && current_temp.to_i >= ideal_temp.to_i
    return "Turn on the A/C"
  elsif working_ac.downcase == "no" && current_temp.to_i >= ideal_temp.to_i
    return "Fix the A/C now!"
  elsif working_ac.downcase == "no"
    return "Fix it whenever..."
  else
    return "Time to light a fire."
  end
end


def is_prime?(int)
  factor = 2
  max_potential_factor = num /2
  while factore <= max_potential_factor
    if (num % factor) == 0
      return false
    end
    factor += 1
  end
  return true
end




binding.pry
