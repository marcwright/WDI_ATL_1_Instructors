puts = "C-3P0, human-cyborg relations. What's your name?"
username = get.chomp
puts "It is a pleasure to meet you, #{name}. Have you ever met a protocol droid before?"
useranswer = gets.chomp
puts "#{useranswer}, How interesting"
puts "user_answer? How interesting, for someone from around these parts."
puts "(Answer \"I do\ or \"I don't\")"

does_he = gets.chomp.upcase

if does_he == 'I DO'
  puts "Oh, marvelous! Simply marvelous! Say hello to R2-D2; he's been looking all over for you."
else
  puts "I've really enjoyed speaking with you " + username + "but if you ..."
  puts "(What's you fav farewell)"
  fave_farewell + " to you too"
  puts "well R2-D2, I suppose we'll just have to keep looking."
  puts "R2-D2: (Agreeable droid noises)"
end
