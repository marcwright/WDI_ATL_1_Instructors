puts "Guess a number?"
num = gets.to_i
answer = rand(11)
count = 1

number_of_guesses = 1

while num != answer
    if num > answer
      puts "Too high!"
    else
      puts "Too low!"
    end
    puts "Guess again"
    num = gets.to_i
    number_of_guesses = number_of_guesses + 1
end

puts "You win, HIGH FIVE. It only took you #{number_of_guesses} number of guesses!"
