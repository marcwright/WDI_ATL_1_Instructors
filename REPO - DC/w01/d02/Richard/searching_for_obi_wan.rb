puts "Greetings, I'm C-3P0, human-cyborg relations."
puts "What is your name?"
name = gets.chomp
puts "It's a pleasure to meet you #{name}."
puts "Have you ever met a protocol droid before?"
ans = gets.chomp
puts "#{ans}? How interesting, for someone around these parts."
puts "I'm terrible sorry for prying, but you don't by chance go by the alias of Obi-Wan Kenobi, do you?"
puts "(Answer \"I do\" or \"I don\'t\")"
resp = gets.chomp.capitalize

if resp == "I do"
  puts "Oh, marvelous! Simply Marvelous! Say hello to R2-D2; he's been looking all over for you."
else
  puts "I've really enjoyed speaking with you, #{name}, but if you'll please excuse me, I have to help my friend find someone named Obi-Wan Kenobi."
  puts "#{fav_farewell = gets.chomp} to you too!"
  puts "Well R2, I suppose we'll just have to keep looking."
  puts "R2-D2: (Agreeable droid noises)"
end
