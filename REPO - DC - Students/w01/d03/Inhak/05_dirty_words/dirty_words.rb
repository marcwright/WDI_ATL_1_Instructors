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
contains_bad_language = false

def bad_language_checker(word)

end

puts "GO AHEAD! SAY YOUR WORST!"
sentence = gets.chomp.downcase.split(" ")

sentence.each do |i|
  dirty_words.each do |j|
    if i == j
      contains_bad_language = true
    end
  end
end

if contains_bad_language == true
  puts "We can't publish that, you potty mouth."
else
  puts "Okay that seems fine."
end
>>>>>>> 6be3f245f9f5cbe2977dffc9b67b6e047f812b24
