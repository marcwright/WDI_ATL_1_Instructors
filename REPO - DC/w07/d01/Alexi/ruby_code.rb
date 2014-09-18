# Ruby
# 

# Variables
beep = "beep" 

# Console Output
puts beep

# Conditionals
number = 10
if number > 5
  puts "Big number"
elsif number < 5
  puts "Little number"
end

# Case Statements
day = "Monday"
case day
when "Monday"
  puts "Get haircut!"
when "Tuesday"
  puts "don't get a haircut"
when "Friday"
  puts "Drink a beer"
else
  puts "Im in limbo"
end

# While Loop
count = 10
while count > 0
  puts count
  count -= 1
end

def add(x,y)
  x + y
end

# Arrays
my_name_array = ["Adam", "Elaine", "Travis"]
my_name_array[0]
my_name_array << "Matt"

# Enumeration
dwarves = ["Doc", "Sleepy", "Bashful", "Grumpy", "Sneezy", "Happy", "Dopey"]

dwarves.each do |dwarf|
  puts dwarf
end

# Hashes
my_hash = {name: "Snow White", age: 17, weakness: "apples" }
my_hash[:name]
my_hash[:age] = 29
