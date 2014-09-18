# variables
beep = "beep"

# Console output
puts beep

# conditionals
number = 10
if number > 5
  puts "Big num"
elsif number < 5
  puts "Tiny num"
else
  puts "must be 5 tho"
end

# case statements
day = "Monday"
case day
when "Monday"
  puts "Get it"
when "Tuesday"
  puts "Twofer"
when "Friday"
  puts "got it"
else
  puts "?"
end

# while loop
count = 10
while count > 0
  puts count
  count -= 1
end

# hash
my_hash = {name: "poochie", race: "dog", age: 5}
my_hash[:name]
