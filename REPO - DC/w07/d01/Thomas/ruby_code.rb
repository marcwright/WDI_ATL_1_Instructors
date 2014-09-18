# Ruby
# This is a Ruby commebt

# Variables
beep = 'beep'

#Console output
puts beep

#conditionals
number = 5
if number > 5
  puts "BIG NJUMBER!"
elsif number < 5
  puts 'little number'
else
  puts "must be 5 then"
end

#Case Statements
day = "Monday"
case day
when "Monday"
  puts "get haircut"
when "Tuesday"
  puts "don't get a haircut"
when "Friday"
  puts "get 3 haircuts"
else
  puts "I'm in limbo"
end

#while loop
count = 10
while count > 0
  puts count
  count -= 1
end

# methods
def add (x ,y)
  x + y
end

# arrays
my_name_array = ["Adam", "Elaine", "Travis"]
my_name_array[0]
my_name_array << "Matt"

#enumeration
dwarves = ["Doc", "Grumpy", "Sleepy", "Bashful", "Dopey", "Sneezy", "Happy"]

dwarves.each do |dwarf|
  puts dwarf
end

#hashes
my_hash = {name: "snow white", age:17, weakness: "apples"}
my_hash[:name]
my_hash[:age] = 29
