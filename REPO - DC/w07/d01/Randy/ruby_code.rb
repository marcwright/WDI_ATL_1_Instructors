# This is a Ruby comment

#Variables
beep = "beep"

#console output
puts beep

#Conditionals
number = 10
if number > 5
  puts "BIG NUMBER!"
elsif number < 5
  puts 'little number'
else
  puts "must be 5"
end

# Case Statements
day = "Monday"
case day
  when "Monday"
    puts "Get Haircut"
  when "Tuesday"
    puts "Don't get a haircut"
  when "Friday"
    puts "Get 3 haircuts"
  else
    puts "I'm in limbo"
  end

# While loop
count = 10
while count > 0
  puts count
  count -= 1
end

# Methods
def add(x, y)
  x + y
end


# Arrays
my_name_array = ["Adam", "Elaine", "Travis"]
my_name_array[0]
my_name_array << "Matt"

# Enumeration
dwarves = ["Pudgy", "Sneaky", "Smurfette"]
dwarves.each do |dwarf|
  puts dwarf
end

# Hashes
my_hash = {name: "Snow White", age: 17, weakness: "Apples"}
my_hash[:name]
my_hash[:age] = 29

