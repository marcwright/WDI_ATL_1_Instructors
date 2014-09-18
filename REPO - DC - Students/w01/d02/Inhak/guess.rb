puts "NUMBERWANG! Guess the number from 0-10, inclusive."
guess = gets.chomp.to_i
count = 0
random_number = rand(11)

while guess != random_number
  if guess < random_number
    puts "Nope! The number is bigger than you think."
  else
    puts "Nope! The number is smaller than you think."
  end
  guess = gets.chomp.to_i
  count += 1
end

puts "NUMBERWANG!!!! YOU GOT THE RIGHT NUMBER!"
puts "It took you #{count} guesses to guess the number."
