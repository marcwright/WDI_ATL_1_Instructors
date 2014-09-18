require 'pry'

def ac_action(current_temp, working, ideal)
  working.downcase
  if working == "y" && current_temp > ideal
    return "Turn on AC"
  elsif working == "n" && current_temp > ideal
    return "fix AC now"
  else
    return "fix AC soon"
  end
end

first = ac_action(70, "y", 29)
sec = ac_action(70, "y", 99)
third = ac_action(1, "n", 29)

print first
# binding.pry
