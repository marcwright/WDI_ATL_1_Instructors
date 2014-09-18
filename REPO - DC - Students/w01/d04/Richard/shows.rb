# require 'pry'

shows = ["Girls", "Game of Thrones", "Silicon Valley", "Arrested Development", "Battlestar Galactica"]


# # count = 0

# # while count < shows.length
# #   puts "I <3 #{shows[count].upcase}"
# #   count = count + 1
# # end


# # def loop_and_print(array)
# #   i=0
# #   while i < array.length
# #     yield array[i] # calls block being passed by array aka {|show| puts "I<3 #{show}"}
# #   end
# #   i += 1
# # end

# # # calling method with block
# # loop_and_print(shows) {|show| puts "I<3 #{show}"}

# # binding.pry


# newshows = []
# shows.each {|i| newshows.push("I <3 #{i}")}
# puts newshows
# puts shows

# newshows = shows.map {|i| "I <3 #{i}"}
# puts newshows
# puts shows
# # using .each return an array with ["I <3 Girls"

name = "Joella"

shows.each {|show| puts name}


newshows = shows.each {|i| "I<3 #{i}"}
