# #Guess the number

# ###Prompt:
# - You are to generate a basic "guess my number" game.  The computer will pick a random number between 0 and 10 inclusive.  The user will guess the number until they guess correctly.

# ###Specification:
# - The user should be asked to guess a number
# - If the user's guess is correct, the user should see a congratulatory message
# - If the user's guess is not correct, the user should be asked to guess the number again.
# - This should be done in a new file called guess_the_number.rb

# ###Bonus 1
# - When the user guesses, you should tell them if they guessed too high or too low

# ###Bonus 2
# - When the user guesses the number correctly, tell them how many guesses it took them.

def rng range
  rng = Random.new
  Random.rand range
end

def guessing_game range
  correct_num = rng range
  puts "Guess a number from #{range.min} to #{range.max}."
  guess = gets.to_i
  num_guesses = 1

  until guess == correct_num
    puts "Sorry, you're too #{guess > correct_num ? "high" : "low"}.  Guess again."
    guess = gets.to_i
    num_guesses += 1
  end

  puts "Congratulations, you got it in #{num_guesses} tries!"
end

guessing_game 0..10
