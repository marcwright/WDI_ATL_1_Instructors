puts "Good morning! What day of the week is it?"
day = gets.chomp.downcase
case day
when "monday"
  puts "Hopefully you don't have a case of the Mondays!"
when "tuesday"
  puts "This is probably the worst day of the week!"
when "wednesday"
  puts "Happy hump day!"
when "thursday"
  puts "Almost there..."
when "friday"
  puts "I can hear Rebecca Black singing somewhere off in the distance."
when "saturday"
  puts "You owe it to yourself to do absolutely nothing today."
when "sunday"
  puts "HBO tonight!"
else
  puts "This isn't a day."
end
