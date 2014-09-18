puts "What day of the week is it?"
day = gets.chomp.downcase
case day
when "monday"
  puts "The start of another week. Good luck!"
when "tuesday"
  puts "Second day of the work week. Hope it was better than yesterday!"
when "wednesday"
  puts "Happy hump day!"
when "thursday"
  puts "Oh yeah, only one day left til the weekend!"
when "friday"
  puts "TGIF!"
else
  puts "Either you're on the weekend, or you're making up days. Get it together."
end
