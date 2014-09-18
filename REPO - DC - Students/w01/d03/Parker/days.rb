# def drinking_age?(age)
# 	if age < 21
# 		puts "You can't drink yet...legally"
# 		return false
# 	else
# 		puts "Drinks Galore!"
# 		return true
# 	end
# end


# def get_answer_to(question)
# 	puts question
# 	answer = gets.chomp
# 	return puts answer
# end

# calc_answer = get _answer_to("how does one build a calculator?")

# puts calc_answer.to_s

# def week_day?(day)
# 	puts "What day of the week is it?" 
# 	answer = gets.chomp
# 	return puts answer
# end


puts "what day is it?"
day = gets.chomp.upcase

case day
when "Monday"
	puts "ugh, Monday, right?"	
when "Tuesday"
	puts "ugh, Tuesday, right?"	
when "Wednesday"
	puts "ugh, Wednesday, right?"	
when "Thursday"
	puts "ugh, Thursday, right?"	
when "Friday"
	puts "ugh, Friday, right?"	
else
	puts "either it's the weekend or your wrong!"

end
