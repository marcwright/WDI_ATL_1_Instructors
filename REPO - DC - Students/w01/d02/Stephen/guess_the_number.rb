print "Welcome to Guess My Number!  First guess: "
target = rand(11)
guess = gets.to_i
count = 1
while guess != target
  print "==>"
  if guess > target
    print "Too high..."
  else
    print "Too low..."
  end

  print "next guess? "
  guess = gets.to_i
  count += 1
end
puts "Hooray!  It was #{target}.  That took you #{count} guesses. Ciao!"
