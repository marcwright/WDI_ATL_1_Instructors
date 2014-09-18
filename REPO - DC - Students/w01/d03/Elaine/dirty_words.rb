dirty_words = ['pee', 'poop', 'she-dog', 'phallus', 'fornicate', 'frack']

puts "Go ahead, say your worst:"
input = gets.chomp.downcase

words = input.split(" ")

publish = true

words.each do |word|
  dirty_words.each do |dirty_word|
    if word == dirty_word
      publish = false
    end
  end
end

if publish == false
  puts "We're rejecting that, you potty mouth."
else
  puts "Okay, we'll publish that."
end

