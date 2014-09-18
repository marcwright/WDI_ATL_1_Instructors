# Ruby
# This is a Ruby comment

# Variables
beep = "beep"

# Console Output
puts beep

# Conditionals
number = 3
if number > 5
  puts "BIG NUMBER!"
elsif number < 5
  puts "little number"
else
  puts "must be 5 then."
end

# Case statements
day = "Monday"
case day
when "Monday"
  puts "Get haircut!"
when "Tuesday"
  puts "Don't get haircut"
when "Friday"
  puts "Get 3 haircuts!"
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
my_name_array = (["Adam", "Elaine", "Richard"]
my_name_array[0]
my_name_array << "Matt"

#Enumeration
dwarves = ["Doc", "Sleepy", "Bashful", "Grumpy", "Dopey", "Happy", "Sneezy"]
dwarves.each do |dwarf|
  puts dwarf

#Hash
my_hash = { name: "Snow White", age: 17, weakness: "apples"}
my_hash[:name]
my_hash[:age] = 29

end
