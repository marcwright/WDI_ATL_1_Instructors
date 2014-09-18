puts "Hi, I'm C-3P0, human cyborg relations. What's your name?"
username = gets.chomp
puts "It is a pleasure to meet you, #{username}. Have you ever met a protocol droid before?"
user_answer = gets.chomp

puts "#{user_answer}? How interesting."
puts "I'm terribly sorry for prying, but you don't by any chance go by the alias of Obi-Wan Kenobi, do you?"
puts "(Answer \"I do\" or \"I don't\")"

does_he = gets.chomp.upcase

if does_he == 'I DO'
  puts "Oh, marvelous! Simply marvelous! Say hello to R2-D2; he's been looking all over for you."
else
  puts "I've really enjoyed speaking with you " + username + " but if you'll please excuse me, I have to help my friend find someone named Obi-Wan Kenobi."
  puts "(What's your fav farewell)"
  fav_farewell = gets.chomp
  puts fav_farewell + " to you too"
  puts "Well R2, I suppose we'll just have to keep looking."
  puts "R2-D2: (Agreeable droid noises)"
end

