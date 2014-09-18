secret_number = rand(11)
puts "Guess a number between 1 and 10"
user_answer = gets.chomp

while user_answer != secret_number
  puts "Guess again ..."
  guess = gets.to_i
end
puts "You are correct!"
