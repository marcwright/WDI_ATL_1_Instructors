command = gets.chomp
#  this gets the command to tell what type of math they are doing.

if command == 'add'
   puts 'please put the first number in, press enter, then put in the second number, and press enter.'
addone = gets.chomp
addtwo = gets.chomp
puts addone.to_f + addtwo.to_f
end

if command == 'sub'
   puts 'please put the first number in, press enter, then put in the second number, and press enter.'
subone = gets.chomp
subtwo = gets.chomp
puts subone.to_f - subtwo.to_f
end

if command == 'div'
   puts 'please put the first number in, press enter, then put in the second number, and press enter.'
divone = gets.chomp
divtwo = gets.chomp
puts divone.to_f / divtwo.to_f
end

if command == 'mult'
   puts 'please put the first number in, press enter, then put in the second number, and press enter.'
multone = gets.chomp
multtwo = gets.chomp
puts multone.to_f * multtwo.to_f
end

def get_answer_to(question)
	puts question
	answer = gets.chomp
	return answer
end

calc_answer = get _answer_to("how does one build a calculator?")