puts "Go ahead say your worst!"
sentence = gets.chomp.split(', ')

dirty_words = ['pee', 'poop', 'she-dog', 'phallus', 'fornicate', 'frack']
<<<<<<< HEAD
<<<<<<< HEAD


puts "Go ahead, say your worst:"
input = gets.chomp


filth = {}
input = input.split(' ')
is_vulgar = false


dirty_words.each do |word|
  filth[word] = true;
end


input.each do |word|
  is_vulgar ||= filth.include?(word)
end


if is_vulgar
  puts "We're rejecting that, you potty mouth."
else
  puts "Okay, we'll publish that."
end
=======
>>>>>>> 5269418d61924848620646f9bddc734bff0c15c5
=======
is_dirty = false

# sentence.each do |words|
#   dirty_words.each do |bad|
#     if words.downcase.include? bad.downcase
#       puts "cannot print!"
#       break
#       end
#   end
# end

sentence.each do |words|
  if !is_dirty
    is_dirty = dirty_words.include?(words)
    return # prevents the enumeration from working through entire array
  end
end

if is_dirty
  puts "No way!"
else
  puts "ok."
end

>>>>>>> 6be3f245f9f5cbe2977dffc9b67b6e047f812b24
