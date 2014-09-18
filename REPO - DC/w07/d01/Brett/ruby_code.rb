# Ruby
# This is a Ruby comment

# Variables
beep = 'beep'

# Console Output
puts beep

# Conditionals
number = 10
if number > 5
  puts 'BIG NUMBER!'
end
elsif number < 5
  puts 'little number'
end
else
  puts 'must be five then'
end

#Case Statements
day = 'Monday'
case day
when 'Monday'
  puts 'Get haircut!'
when 'Tuesday'
  puts 'Dont get haircut'
when 'Friday'
  puts 'get three haircuts'
else
  puts "I'm in limbo"
end

#While Loop
count = 10
while count > 0
  puts count
  count -= 1
end

#Methods
def add(x, y)
  x + y
end

#Arrays
my_name_array = ["Adam", "Elaine", "Travis"]
my_name_array[0]
my_name_array << "Matt"

#Enumeration
dwarves = ["Doc","Sleepy","Bashful","Grumpy","Dopey","Sneezy","Happy"]

dwarves.each do |dwarf|
  puts dwarf
end

#Hashes
my_hash = {name: "Snow White", age: 17, weakness: "apples"}
my_hash[:name]
my_hash[:age] = 29
