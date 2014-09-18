<<<<<<< HEAD
dirty_words = ['pee', 'poop', 'she-dog', 'phallus', 'fornicate', 'frack']
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
# Stephen Stanwood (stephen@stanwoodsolutions.com)

def ok_to_print?(words)
  dirty_words = ['pee', 'poop', 'she-dog', 'phallus', 'fornicate', 'frack']

  words.each { |w| return false if dirty_words.include? w }

  return true
end

print "Go ahead, say your worst: "
user_words = gets.chomp.downcase.split(' ')
if(ok_to_print?(user_words))
  puts "Looks good to us!"
else
  puts "Uh-oh... we have to check that out..."
end

puts
>>>>>>> 6be3f245f9f5cbe2977dffc9b67b6e047f812b24
