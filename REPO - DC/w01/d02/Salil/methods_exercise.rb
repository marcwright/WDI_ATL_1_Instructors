require pry

def drinking_age (age)
  if (age < 21)
    puts ("Underage. Banned")
    return false
  else
    puts ("You're goodgoit !")
    return true
  end
end

def ac_action (cTemp, a_c, dTemp)
  if a_c == "yes" && cTemp > dTemp
    return "Turn on the A/C, please"
  elsif a_c == "no" && cTemp > dTemp
    return "Fix your A/C now! It's hot!"
  elsif (a_c == "no" && cTemp < dTemp) || (a_c == "yes" && cTemp < dTemp)
    return "Fix your A/C whenever you have the time. It's cool.."
  end
end

def is_prime (num)
  for i in 2..num-1
    if num % i == 0
      return false
    else
      return true
    end
  end
end
