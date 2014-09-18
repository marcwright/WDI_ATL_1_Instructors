puts "C-3P0, human-cyborg relations. What is your name?"
name = gets.chomp
puts "It is a pleasure to meet you, #{name}. Have you ever met a protocol droid before?"
answer = gets.chomp.capitalize
puts "#{answer}? How interesting, for someone from around these parts."
puts "I'm terribly sorry for prying, but you don't by any chance go by the alias of Obi-Wan Kenobi, do you?"
user_answer = gets.chomp.upcase

if user_answer == "I DO"
  puts "Oh, marvelous! Simply marvelous! Say hello to R2-D2; he's been looking all over for you."
else
  puts "I've really enjoyed speaking with you, #{name}, but if you'll please excuse me, I have to help my friend find someone named Obi-Wan Kenobi."
  puts "Say goodbye:"
fav_farewell = gets.chomp.capitalize
puts "#{fav_farewell} to you too... Well R2, I suppose we have to keep looking."
puts "R2-D2: (Agreeable droid noises)"
end
