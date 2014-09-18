puts "Hello, I am C-3P0, human-cyborg relations."
puts "What should I call you?"
name = gets.chomp
puts "It is a pleasure to meet you, #{name}. Have you ever met a protocol droid before?"
user_answer = gets.chomp
puts "#{user_answer}? How interesting, for someone from around these parts."
puts "I'm terribly sorry for prying, but you don't by any chance go by the alias of Obi-Wan Kenobi, \ndo you? (Answer \"I do\" or \"I don't\")"
user_answer2 = gets.chomp.downcase
if user_answer2 == "i do" 
	puts "Oh, marvelous! Simply marvelous! Say hello to R2-D2; he's been looking all over for you."
else
	puts "I've really enjoyed speaking with you, #{name}, but if you'll please excuse me, \nI have to help my friend find someone named Obi-Wan Kenobi."
puts "What is your favorite way to say goodbye?"
fave_farewell = gets.chomp
puts "#{fave_farewell} to you too!"
puts "Well R2, I suppose we'll just have to keep looking."
puts "R2-D2: (Agreeable droid noises) beep boopboop beep!"
end
