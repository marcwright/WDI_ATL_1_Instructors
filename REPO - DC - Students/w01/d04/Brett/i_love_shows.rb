 shows = ["Girls", "Game of Thrones", "Silicon Valley", "Arrested Development", "Battlestar Galactica"]


# count = 0
#  while count < shows.length

#   puts "I <3 #{shows[count]}!!!".upcase
#   count += 1

#  end

#  def loop_and_print(array, prepend_string, uppercase)

#   i = 0

#   while i < array.length
#     yield array[i] # yield says call the block and pass in array.i as the argument
#     i += 1

# #     do |show| # THIS IS THE BLOCK
# #       puts "I <3 #{show}"
#    end
#  end

### Calling the method with a block
# loop_and_print(shows) do |show|
#   puts "I <3 #{show}"
# end

shows.each do |show|
  puts "I <3 #{show}"
end

#OR

shows.each { |show| puts "I <3 #{show}"}
