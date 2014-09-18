puts "Hello, I am C-3PO, human-cyborg relations"
puts "Please, may I know your name?"
name = gets.chomp.capitalize!
puts "It is a pleasure to meet you, #{name}. Have you ever met a protocol droid before?"
user_answer = gets.chomp.capitalize!
puts "#{user_answer}? How interesting, for someone from around these parts."
puts  "I'm terribly sorry for prying, but you don't by any chance go by the alias of Obi-Wan Kenobi, do you? \n(Answer \"I do\" or \"I don't\")"
obi_answer = gets.chomp.downcase!
if obi_answer == "i do"
  puts "Oh, marvelous! Simply marvelous! Say hello to R2-D2; he's been looking all over for you."
else
  puts "I've really enjoyed speaking with you, #{name}, but if you'll please excuse me, I have to help my friend find someone named Obi-Wan Kenobi."
end
puts "  Say goodbye to C-3PO!"
bye = gets.chomp.capitalize!
puts "#{bye} to you too, #{name}"
puts "Well R2, I suppose we'll just have to keep looking."
puts "R2-D2: (Agreeable droid noises)"

