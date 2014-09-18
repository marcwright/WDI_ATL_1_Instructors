shows = ["Girls", "Game of Thrones", "Silicon Valley", "Arrested Development", "Battlerstar Galactica"]

# def loop_and_print(array)
# 	i = 0
# 	while i < array.length
# 		yield array[i]
# 		i += 1
# 	end
# end


# loop_and_print(shows) {|show| puts "I <3 #{show}"}

shows.each{|show| puts "I <3 #{show}"}