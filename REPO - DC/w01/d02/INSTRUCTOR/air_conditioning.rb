puts "What is the current temperature?"
temperature = gets.to_i
puts "Is the AC currently working?"
ac_working = gets.chomp.downcase
puts "What temperature do you wish it was?"
ideal_temperature = gets.to_i

if ac_working == "yes" && temperature >= ideal_temperature
  puts "Turn on the AC please!"
elsif ac_working == "no" && temperature >= ideal_temperature
  puts "Fix the AC! I am really hot!"
elsif ac_working == "no"
  puts "Fix the AC whenevs. It\'s cool"
else
  puts "It is really chilly. Maybe we should light a fire"
end

if ac_working == "yes"
  if temperature >= ideal_temperature
    puts "Turn on the AC please!"
  else
    puts "It is really chilly. Maybe we should light a fire"
  end
else
  if temperature >= ideal_temperature
    puts "Fix the AC! I am really hot!"
  else
    puts "Fix the AC whenevs. It\'s cool"
  end
end