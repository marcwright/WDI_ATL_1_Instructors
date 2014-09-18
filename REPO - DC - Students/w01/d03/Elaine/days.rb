puts "What day of the week is it? (Monday - Friday)"
weekday = gets.chomp.downcase

if weekday == "friday"
  puts "TGIF!"
else
  puts "Have a great day!"
end
