# Equality ( ==, !=, >, <)
0 == 1
1 != 0
5 < 9
1.1 >= 1

# Boolean operators ( && , ||, !)
true && true
true && false
true || false
false || true
false || false
true || true
!true
!false


# Demonstrate conditional statements

# If/else/unless
if true
  p "Its true!"
end

if (2 + 2) == 5
  p "We have a problem"
end

if (2 + 2) == 5
  p "We have a problem"
else
  p "its not 1984 yet"
end

if (2 + 2) == 5
  p "We have a problem"
elsif (2 + 2) != 5
  p "its not 1984 yet"
else
  p "I will never be seen"
end

unless name == "david"
  p "Your name is definitely not david"
end

# switch/case
grade = "B"
case grade
  when "A"
    puts 'Well done!'
  when "B"
    puts 'Try harder!'
  when "C"
    puts 'You need help!!!'
  else
    puts "You just making it up!"
end