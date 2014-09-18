dirty_words = ['pee', 'poop', 'she-dog', 'phallus', 'fornicate', 'frack']

puts "Go ahead and say your worst"
phrase = gets.chomp.downcase.split(' ')
is_dirty = false

phrase.each do |word|
  if !is_dirty
    is_dirty = dirty_words.include?(word)
  end
end

if is_dirty
  puts "We're rejecting that, you potty mouth."
else
  puts "Okay, we'll publish that."
end
