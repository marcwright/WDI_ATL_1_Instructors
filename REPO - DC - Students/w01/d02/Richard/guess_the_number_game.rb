rand_num = rand(11)
puts "Pick a number between 0 and 10"
user_num = gets.to_i
count = 1

while rand_num != user_num
  if user_num > rand_num
  puts "Oh.. Too high, guess again"
  else
    puts "Oh, too low.... keep trying."
  end
  user_num = gets.to_i
  count += 1
end

puts "You got it right, and it only took you #{count} tries!"
