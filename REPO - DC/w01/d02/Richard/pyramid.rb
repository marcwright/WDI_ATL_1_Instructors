puts "Tell me your favorite special character:"
sp_char = gets.chomp

puts "In an ideal world, a pyramid would have how many layers?"
pyramid = gets.to_i
rev_pyr = 1

puts "Would you like your pyramid upside down?"
origin = gets.chomp.downcase

if origin == "no"
  while rev_pyr <= pyramid
    puts (sp_char * rev_pyr).center(35)
    rev_pyr += 1
  end
else
  while pyramid > 0
    puts (sp_char * pyramid).center(35)
    pyramid -= 1
  end
end
