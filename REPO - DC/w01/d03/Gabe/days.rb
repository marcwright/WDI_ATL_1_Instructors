puts "Enter the current day.:"
curr_day = gets.chomp.downcase

case curr_day
	
when "monday" 
    puts "Manic Monday."

when "tuesday" 
    puts "Little known fact: tuesdays are useless."

when "wednesday" 
    puts "Hump Day."

when "thursday" 
    puts "Thump Day."

when "friday" 
    puts "TGIF"

when "saturday" 
    puts "The best day of all!"

else
    puts "Happy Sunday."

end