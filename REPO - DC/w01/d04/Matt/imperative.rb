# # imperative and declarative exercise

require "pry"

shows = ["girls", "thrones", "louie", "arrested"]

# count = 0


# ### The Block as an imperative version
# # while count < shows.length
# #   puts "I <3 #{shows[count].upcase}"
# #   count = count + 1
# # end

# ### The method as a declarative version
# def loop_and_print(array)
#   i = 0
#   while i < array.length
#     yield array[i]
#     i += 1
#   end
# end

# ### What the block looks like by itself
# # do |show|
# #   puts "I <3 #{show}"
# # end

# loop_and_print(shows) do |show|
#   puts "I <3 #{shows}"
# end

# ### Simple method
# shows.each {|i| puts "I <3 #{i}"}

# # or

# shows.each do |show|
#   puts "I <3 #{shows}"
# end

# ### to add "I <3 " before all shows

# love_shows = []

# shows.each do |show|
#   love_shows.push("I <3 #{show}")
# end

# ### use .map to apply to shows
# # doesn't have to use a new array
# love_shows = shows.map do |show|
#   "I <3 #{show}"
# end

# ### use .map when we want a new copy
# ### use .each when we don't need a new copy back

### Looking at scope
## a block has access to local variables
## but outside access inside a block is forbidden
# name = "matt"

# shows.each do |show|
#   puts name
# end

### select
# numbers = [1,2,3,4,5,6,7,8,9,10]
# even_numbers = numbers.select do |number|
#   number.even?
# end

### join
# alpha = ['a','b','c','d']
# alpha.join # joins without any argument
# alpha.join(' , ')

### reduce
numbers = [1,2,3,4,5,6,7,8,9,10]
numbers.reduce(:+) # adds numbers in array
numbers.reduce(:*) # multiplies nums in array


binding.pry
