puts "I am C-3P0, human-cyborg relations."

puts "May I ask your name sir?"
print "name: " 
name = gets.chomp

unless name == "Obi-Wan Kenobi"



	puts "It is a pleasure to meet you, #{name}. Have you ever met a protocol droid before?"
	answer = gets.chomp

	print "...awkward silence..." 
	sleep 5 
	print "...more silence..." 
	sleep 5
	print "...a lone jawa cackles in the distance..." 
	sleep 5

	puts "aaaaanyway,"
	puts "oh, #{answer}? How interesting, for someone from around these parts."

	print  "I'm terribly sorry for prying, but you don't by any chance go by the alias of Obi-Wan Kenobi, do you? (Answer \"I do\" or \"I don\'t\")"
	obi = gets.chomp.downcase

		unless obi == "i do"
			puts "I've really enjoyed speaking with you, #{name}, but if you'll please excuse me, I have to help my friend find someone named Obi-Wan Kenobi."
			puts "(say goodbye)"
			bye = gets.chomp

			puts "#{bye.capitalize} to you too."
    		puts "Well R2, I suppose we'll just have to keep looking."
    		puts "(R2-D2 makes Agreeable droid noises)"

   		else puts "Oh, marvelous! Simply marvelous! Say hello to R2-D2; he's been looking all over for you."	
   		end


else puts  "Oh, marvelous! Simply marvelous! Say hello to R2-D2; he's been looking all over for you."	
end
