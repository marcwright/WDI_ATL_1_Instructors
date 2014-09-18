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

puts "Go ahead, say your worst!"
phrase = gets.chomp.downcase.split(' ')

is_dirty = false
phrase_array.each do |x|
  dirty_words.each do |y|
    if x == y
      is_dirty = true
    end
  end
end

if is_dirty == true
  puts "this is dirty!"
else
  puts "this is ok, we will publish"
end
>>>>>>> 6be3f245f9f5cbe2977dffc9b67b6e047f812b24
