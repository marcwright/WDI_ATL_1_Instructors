###Objectives
- Use while loops to execute code multiple times
- Set and update a condition to avoid infinite loops

###Loops
* Why? Loops give us leverage over our data - allows us to use the computers processing power to do a lot of things.

* while
  * `while condition end`
  * `code while condition`
  * `begin end while condition`
* until
  *  same as above
* for loop we'll do during arrays

### Are we there yet?

```
answer = "N"
puts "Are we there yet? (Y/N)"
answer = gets.chomp

while answer != "Y"
  puts "Are we there yet? (Y/N)"
  answer = gets.chomp
end

puts "We made it!"
```

* We need a condition, or get an infinite loop
```
  while 4 < 5
    puts "hi"
  end
```

### Math Prompt

```
puts "what is 2 to the 16th power?"
answer = gets.chomp.to_i
```

 Use a while loop to let the user guess again until he/she gets the answer right.
 Once the user guesses right, print "Good Job"
```
puts "what is 2 to the 16th power?"
answer = gets.chomp.to_i
while answer != 2 ** 16
puts "what is 2 to the 16th power?"
answer = gets.chomp.to_i
end
```

# Countdown
```
count = 10
while count > 0
  puts count
  count -= 1
end
puts "Happy New Year!"
```