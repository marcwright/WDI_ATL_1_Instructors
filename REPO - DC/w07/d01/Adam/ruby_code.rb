#Ruby
#This is a Ruby comment

# Variable
beep = 'beep'

#Console Output
puts beep

# Conditionals
number = 5
if number > 5
  puts "Big Number!"
  elsif number < 5
  puts "little number"
else
  puts 'must be 5 then'
end

# Case Statements
day ='friday'
case day
when 'Monday'
  puts 'get Haircut'
when 'Tuesday'
  puts 'dont get a haircut'
when 'Friday'
  puts 'get 3 haricut'
else
  puts 'im in limbo'
end

# While loop

count = 10
while count > 0
  puts count
  count -= 1
end

#Arrays
my_name_array = ["Adam", "Jesse", "Matt"]
my_name_array[0]
my_name_array << "Matt"

#Enumeration
dwarves = ["Doc", "Sleepy", "Happy", "Grumpy"]

dwarves.each do |dwarf|
  puts dwarf
end
