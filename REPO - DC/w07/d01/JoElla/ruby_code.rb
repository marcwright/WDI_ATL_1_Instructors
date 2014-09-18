#Ruby

#variables

beep = "beep"


#console output
puts beep

#conditionals

number = 10

if number > 5
  puts "BIG NUMBER"
elsif number < 5
  puts "little number"
else
  puts "must be 5"
end


#Case statements

day = "Monday"
case day
  when "Monday"
    puts "Get haircut"
  when "Tuesday"
    puts "no haircut"
  when "Friday"
    puts "three haircuts today"
  else
    puts "I'm nowhere"
end


# while loop

count = 10
while count > 0
  puts count
  count -= 1
end
