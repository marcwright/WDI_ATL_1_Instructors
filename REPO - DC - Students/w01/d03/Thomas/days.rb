puts "What day of the week is it (mon-fri)?"
day = gets.chomp.downcase

case day
when "monday"
	puts "oh Monday..."
when "tuesday"
	puts "hooray for increased productivity"
when "wednesday"
	puts "Hump DDDAAYYYY!"
when "thursday"
	puts "the last productive day of the week"
when "friday"
	puts "thank goodness, you made it!"
else
	puts "thats not a day dummy"
end
