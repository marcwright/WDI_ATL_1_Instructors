require 'pry'

def drinking_age?(age)
  if (age < 21)
    puts "This person is underage."
    return false
  else
    puts "This person can drink all they want"
    return true
  end
end

def ac_action(current_temp, working, desired_temp)
  if (working && current_temp > desired_temp)
    return "Turn on the A/C please."
  elsif(!working && current_temp > desired_temp)
    return "Fix the A/C now! It's hot!"
  elsif(!working && current_temp < desired_temp)
    return "Can you fix the A/C when you have the chance? Thanks!"
  end
end

def is_prime?(num)
  if (num > 2)
    counter = 2
    while counter < num do
      if num % counter == 0
        return false
      end
      counter +=1
    end
    return true
  else
    return false
  end
end

binding.pry
