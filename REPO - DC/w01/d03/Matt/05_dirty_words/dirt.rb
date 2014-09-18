dirty_words = ['pee', 'poop', 'she-dog', 'phallus', 'fornicate', 'frack']

# dirty_words.each do |i|
#   puts i
# end

puts "Say anything"
anything = gets.chomp.downcase.split(" ")
is_dirty = false

anything.each do |word|
  if !is_dirty
    is_dirty = dirty_words.include?(word)
  end
end

if is_dirty
  puts "no good"
else
  puts "fine"
end










