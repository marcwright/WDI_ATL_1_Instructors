# this is a comment

=begin
  this is a
  block comment
=end

# variable assignment
variable = "value"
puts variable

# conditionals
number = 10
if number > 5
  puts "It's greater than 5."
elsif number < 5
  puts "It's less than 5."
else
  puts "It's equal to 5."
end

# case statement
day = "Saturday";
case day
when "Monday"
  puts "The workweek is starting."
when "Wednesday"
  puts "Halfway through the workweek."
when "Friday"
  puts "The workweek is almost over."
when "Saturday", "Sunday"
  puts "It's the weekend!"
else
  puts "Keep on trucking."
end

# while loop
count = 10
while count > 0
  puts count
  count -= 1
end

# method
def add(one_num, another_num)
  one_num + another_num
end
puts add(2, 2);

# proc
add = Proc.new { |one_num, another_num| one_num + another_num }
puts add(2, 2);

# array
dwarves = ["Bashful", "Doc", "Dopey", "Grumpy", "Happy", "Sleepy", "Sneezy"]

# enumeration
dwarves.each { |dwarf| put "Hi, I am #{ dwarf }." }

dwarves.each_with_index do |dwarf, index|
  puts "I am dwarf ##{ index }, #{ dwarf}."
end

# object
class Bird
  def initialize( name )
    @name = name
  end

  def chirp
    return "Tweet, Tweet, Tweet!"
  end

  def greet
    return "Hi, my name is #{ name }."
  end

  private
    def name; @name; end
end

myBird = Bird.new("Tweety")