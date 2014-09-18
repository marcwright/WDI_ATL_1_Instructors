puts "What is your current temperature? (Farenheit)"
  cTemp = gets.to_i
puts "Is your A/C unit functional?"
  a_c = gets.chomp.downcase!
puts "What is your desired temperature?"
  dTemp = gets.to_i
puts a_c
if a_c == "yes" && cTemp > dTemp
  puts "Turn on the A/C, please"
elsif a_c == "no" && cTemp > dTemp
  puts "Fix your A/C now! It's hot!"
elsif (a_c == "no" && cTemp < dTemp) || (a_c == "yes" && cTemp < dTemp)
  puts "Fix your A/C whenever you have the time. It's cool.."
end

