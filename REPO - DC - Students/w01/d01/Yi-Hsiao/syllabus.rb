# Building Ruby Familiarity

# In this exercise you will take a first look at some common commands in Ruby.
# The idea here is to build your comfort level with basic Ruby syntax and
# working in the console/pry.

# NOTE: Some of this will be review from the pre-work; some won't.
# Just type them in and see the displayed output.

# Steps:
#   1. Open up a new terminal window
#   2. Launch pry
#   3. Paste a line of code into pry
#   4. Press return
#   5. **Examine the displayed output and try to make sense of what the code did.**
#   6. Repeat steps 3-5 for all lines below in order

trav_age = 54 / 2
#=> 27

puts trav_age
# prints "27" with a line return in the console
#=> nil

print trav_age
# prints "27" without a line return in the console
#=> nil

trav_age = 54 / 2.to_f
#=> 27.0

trav_age = 54.to_f / 2
#=> 27.0

trav_age = 54 / 2.0
#=> 27.0

trav_age = 54.0 / 2
#=> 27.0

trav_age = trav_age.round * 4
#=> 108

def get_character(full_string, index)
  # returns character in "index" position in "full_string"
  return full_string[index]
end

message_string = "Richard Hessler enjoys discussing wine."
#=> "Richard Hessler enjoys discussing wine."

character_1 = get_character(message_string, 8)
#=> "H"

character_2 = get_character(message_string, 9)
#=> "e"

character_3 = get_character(message_string, 12)
#=> "l"

character_4 = get_character(message_string, 19)
#=> "o"

message_array = [character_1, character_2]
#=> ["H", "e"]

message_array.push(character_3)
#=> ["H", "e", "l"]

message_array.push(character_3)
#=> ["H", "e", "l", "l"]

message_array.pop()
# WAIT! What just happened to our sweet, sweet array?
#=> "l"

puts message_array
## Prints the following lines:
#> H
#> e
#> l
#=> nil

message_array.push(character_3)
#=> ["H", "e", "l", "l"]

message_array.push(character_4)
#=> ["H", "e", "l", "l", "o"]

message_array
#=> ["H", "e", "l", "l", "o"]

puts message_array
## Prints the following lines:
#=> H
#=> e
#=> l
#=> l
#=> o

message_array.join
#=> "Hello"

message_array.join + " dearest students!"
#=>"Hello dearest students!"

print message_array
# prints "["H", "e", "l", "l", "o"]" to the console

value_float_1 = Math.sin(Math::PI / 2)
#=> 1.0

value_float_2 = Math.cos(Math::PI)
#=> -1.0

value_float_3 = (value_float_1 + value_float_2)
#=> 0.0

value_integer_1 = (value_float_1 + value_float_2).to_i
#=> 0

value_float_1 = value_float_1 * 4
#=> 4.0

value_float_2 *= 5
#=> -5.0

value_float_2 = value_float_2.abs
#=> 5.0

value_integer_1 += 8
#=> 8

value_float_4 = value_integer_1 * 3
#=> 24; note it's a fixnum instead of a float

value_float_3 -= 1
#=> -1.0

number_array = [value_float_1, value_float_2, value_float_3, value_float_4]
#=> [4.0, 5.0, -1.0, 24]

number_array.push(trav_age)
#=> [4.0, 5.0, -1.0, 24, 108]

number_array.unshift(value_integer_1)
#=> [8, 4.0, 5.0, -1.0, 24, 108]

number_array.push(value_integer_1)
#=> [8, 4.0, 5.0, -1.0, 24, 108, 8]

number_array.unshift( Math.sqrt(36) )
#=> [6.0, 8, 4.0, 5.0, -1.0, 24, 108, 8]

number_array.delete_at(5)
# deletes the 6th value in number_array
#=> 24

number_array.push( [19, 21, 6, 3, 1] )
#=> [6.0, 8, 4.0, 5.0, -1.0, 108, 8, [19, 21, 6, 3, 1]]

number_array.flatten!
#=> [6.0, 8, 4.0, 5.0, -1.0, 108, 8, 19, 21, 6, 3, 1]

number_array.each do |current_index|
  puts get_character(message_string, current_index)
end
# for each value, N, in number_array
# print the Nth character in the message string.

# Other considerations:
# negative values count from the end of a string backwards
# current_index.to_i if current_index.is_a? Float
# nil if current_index > message_string.length
