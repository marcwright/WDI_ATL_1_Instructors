def drinking_age?(age)
  puts age
  age = gets.to_i
  legal_time = 21 - age
  if age < 21
    puts "You are under 21 :( You may drink in #{legal_time} years"
  else
    puts "You are good to go."
  end
  return age >= 21
end

puts drinking_age(20)


