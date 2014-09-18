require 'pry'

def drinking_age?(age)
  if age < 21
    print "You can't legally drink!"
    return false
  else
    print "You can legally drink!"
    return true
  end
end

def ac_action(curr_temp, functional, ideal_temp)
  functional.downcase
  if functional == "yes" && curr_temp > ideal_temp
    return "Turn on the AC please"
  elsif functional =="no" && curr_temp > ideal_temp
    return "Fix the A/C... Now it's hot!"
  elsif function =="no" && curr_temp < ideal_temp
    return "Fix the A/C whenever you have the chance...  It's cool..."
  else
    return "everything is swell"
  end
end

def is_prime?(int)
  dividers = 1
  num_of_div = 0
  while dividers <= 25
    remain = int%dividers
    if remain == 0
      num_of_div += 1
    end
    dividers += 1
  end
  if num_of_div <= 2
    return true
  else
    return false
  end
end

binding.pry
