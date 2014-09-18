require 'pry'

def drinking_age?(age)
  if (age < 21)
    puts "You are not able to drink"
    return false
  else
    puts "Do it up big"
    return true
  end
end

drinking_age?(19)
drinking_age?(22)

def ac_action(currtemp, functional, destemp)
  if (funcitonal == y && currtemp > destemp)
    return "Turn on the A/C please"
  elsif (functional != y && currtemp > destemp)
    return "Fix the A/C now, it's hot!"
  else
    return "Fix the A/c when you get a chance"
  end
end



