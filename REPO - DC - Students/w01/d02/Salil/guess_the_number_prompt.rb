rNum = rand(11)
count = 1
puts "Please guess a number between 0-10"
answer = gets.to_i

while rNum != answer
  if rNum > answer
    puts "You guessed too low!"
  elsif rNum < answer
    puts "You guessed too high!"
  end
  puts "Please guess again!"
  answer = gets.to_i
  count += 1
end
puts "You got it!"
puts "It took you #{count} times to guess the number!"
