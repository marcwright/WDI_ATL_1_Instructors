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
# 27
puts trav_age
# prints 27, line break
print trav_age
# prints 27
trav_age = 54 / 2.to_f
# 27.0
trav_age = 54.to_f / 2
# 27.0
trav_age = 54 / 2.0
# 27.0
trav_age = 54.0 / 2
# 27.0
trav_age = trav_age.round * 4
# round age to closest integer and multiply by 4 = 216
def get_character(full_string, index)
  return full_string[index]
end
# returns nth character from string (starts from 0)
message_string = "Richard Hessler enjoys discussing wine."

character_1 = get_character(message_string, 8)
# H
character_2 = get_character(message_string, 9)
# e
character_3 = get_character(message_string, 12)
# l
character_4 = get_character(message_string, 19)
# o
message_array = [character_1, character_2]
# create array with two values
message_array.push(character_3)
# adds new entry to array
message_array.push(character_3)

message_array.pop()
# WAIT! What just happened to our sweet, sweet array?
# removes last character from array and displays it
puts message_array
# displays array
message_array.push(character_3)
# adds character to array
message_array.push(character_4)
# adds charafter to array
message_array
# return array
puts message_array
# display array
message_array.join
#converts characters to strings and concatenates
message_array.join + " dearest students!"
# "array characters dearest students"
print message_array
# displays the array

value_float_1 = Math.sin(Math::PI / 2)
# sine of 90 degrees
value_float_2 = Math.cos(Math::PI)
# cosine of 180 degrees
value_float_3 = (value_float_1 + value_float_2)
# add the two previous values
value_integer_1 = (value_float_1 + value_float_2).to_i
# takes value of previous line and convert to integer

value_float_1 = value_float_1 * 4
# multiply value_float_1 by 4
value_float_2 *= 5
# multiply and update the value_float_2 by 5
value_float_2 = value_float_2.abs
#absolute value of value_float_2
value_integer_1 += 8
#add 8 and update value_integer_1
value_float_4 = value_integer_1 * 3
#assign value_integer_1 multiplied by 3 to value_float_4
value_float_3 -= 1
#subtract 1 and update value_float_3

number_array = [value_float_1, value_float_2, value_float_3, value_float_4]

number_array.push(trav_age)
# add Travis' age to the array
number_array.unshift(value_integer_1)
# adds value_integer_1 to first position in the array
number_array.push(value_integer_1)
# adds value_integer_1 to last position in array
number_array.unshift( Math.sqrt(36) )
# adds square root of 36 to beginning of the array
number_array.delete_at(5)
# removes value at index 5 from the array
number_array.push( [19, 21, 6, 3, 1] )
# add numerous values to the array
number_array.flatten!
# convert multi-dimensional arrays into one array
number_array.each do |current_index|
  puts get_character(message_string, current_index)
end
# gets the character from Richard Hessler string for each index in array
