dirty_words = ['pee', 'poop', 'she-dog', 'phallus', 'fornicate', 'frack']
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======

puts "Please enter a phrase: "
  phrase = gets.chomp.downcase.split(' ')
  is_dirty = false

  phrase.each do |word|
    if !is_dirty
      is_dirty = dirty_words.include?(word)
    end
  end
    if is_dirty
      puts "WARNING! Phrase rejected."
    else
      puts "Thank you."
    end
>>>>>>> 9a860de93c30968e6d6dda3a663586e8bf7f9022


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
<<<<<<< HEAD
=======
>>>>>>> 5269418d61924848620646f9bddc734bff0c15c5
=======

puts "Please enter a phrase: "
  phrase = gets.chomp.downcase.split(' ')
  is_dirty = false

  phrase.each do |word|
    if !is_dirty
      is_dirty = dirty_words.include?(word)
    end
  end
    if is_dirty
      puts "WARNING! Phrase rejected."
    else
      puts "Thank you."
    end

>>>>>>> cdff1657cd43d0c9dfc39f74ebe18a86917356af
=======
>>>>>>> 9a860de93c30968e6d6dda3a663586e8bf7f9022
