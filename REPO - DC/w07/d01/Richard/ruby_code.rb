# Ruby
# This is a ruby comment

# Variables
beep = 'beep'

# Console Output
puts beep

# Conditionals
num = 3

if num > 5
  puts "BIG NUMBER!"
elsif num < 5
  puts "little number"
else
  puts "must be 5 then"
end


# Case Statements
day = "Salil"

case day
when "Monday"
  puts "Get Haircut!"
when "Tuesday"
  puts "Don't get a haircut"
when "Friday"
  puts "Get three haircuts"
else
  puts "I'm in Haircut limbo!"
end


# While loop

count = 10
while count > 0
  puts count
  count -= 1
end


# Methods
def add (x, y)
  x + y
end

# Arrays
my_name_array = ["Adam", "Elaine", "Travis"]
my_name_array[0]
my_name_array << "Matt"

# Enumeration
people = ["Inhak", "Elaine", "Yi-Hsiao", "Salil", "Brett"]
people.each do |person|
  puts person
end

# Hashes
my_hash = {
  name: "Snow White",
  age: 17,
  weakness: "apples"
}
my_hash[:name] # => "Snow White"
my_hash[:age] # => 29
