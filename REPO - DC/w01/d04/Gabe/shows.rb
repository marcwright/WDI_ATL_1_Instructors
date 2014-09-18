shows=["Girls", "Silicon Valley", "House of Cards", "Star Trek", "Game of Thrones"]
count = 0

#while count < shows.length
#	puts "I love #{shows[count].upcase}!!!"
#	count = count + 1
#end



#def iterate_and_print(array)
#	i = 0
#	while i < array.length
#		yield array[i]	
#		i = i+ 1
#	end
#end
#
#
#a=[] 
#
#iterate_and_print(shows) do|show| 
#		puts "I love #{show}." 
#	end

shows.each do |tvshows|
	puts "I love #{tvshows}."
end

feelingsaboutshows = []
shows.each do |show|
feelingsaboutshows.push("I love #{show}!")
end

puts feelingsaboutshows

#map makes a new copy of array--to be used instead of do
#when you want to do something for each array.

feelings_about_shows_array_using_map = shows.map do |show|
	"I LOVE #{show}!!!"
end

puts feelings_about_shows_array_using_map

puts feelings_about_shows_array_using_map.join #join turns array into a single string


numbers=[1, 2, 3, 4, 5, 6] 

puts numbers.reduce(:+) #this adds the numbers in 'numbers'
						#together, and spits result (21)

						
