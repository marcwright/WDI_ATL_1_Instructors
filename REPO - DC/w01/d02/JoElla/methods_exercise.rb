
#require 'pry'
=begin
def drinking_age?(age)
  if age < 21
    puts "You\'re too young, son!"
    return false
  else
    puts "You\'re drunk anyway."
    return true
  end
end

drinking_age?(40)



def ac_action(current_temp, ac_status, ideal_temp)
  if ac_status = "working" && current_temp > ideal_temp
    return puts "Turn the AC on, please."
  elsif ac_status = "broken" && current_temp > ideal_temp
    return puts "Fix the AC now,  it's hot!"
  else
    return puts "Fix the AC whenevs"
  end
end

ac_action(50, "working", 45)
=end

def is_prime?(int)
  while int >= 25
    div_answer = int % (int - 1)
    int = int - 1
      if div_answer == 0
        return puts "PRIME!!"
      else return puts "not prime"
      end
    end
  end

is_prime?(20)




