puts "What is the current temperature?"
current = gets.to_i

puts "Is the A/C functional?"
ac = gets.chomp.downcase

puts "What temperature do you wish it was?"
wish = gets.to_i

if ac == "yes" && current > wish
	puts "Turn on the A/C please"
elsif ac == "no" && current > wish
	puts "Fix the A/C now! It's hot!"
elsif ac == "no"
	puts "Fix the A/C whenever you have the chance... It's cool..."
else
	puts "Everything is swell."
end

# if ac == "yes"
# 	if current > wish
# 		puts "Turn on the A/C please"
# 	end
# else
# 	if current > wish
# 		puts "Fix the A/C now! It's hot!"
# 	else
# 		puts "Fix the A/C whenever you have the chance... It's cool..."
# 	end
# end