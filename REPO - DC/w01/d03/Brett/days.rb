puts "What day of the week is it? (Monday-Friday)"
day = gets.chomp.downcase

case day
  when "monday"
    puts "Mondays..."
  when "tuesday"
    puts "Tuesdays aren't much better than Mondays..."
  when "wednesday"
    puts "Hump day!"
  when "thursday"
    puts "Happy hour?"
  when "friday"
    puts "TGIF"
  else
    puts "That's not a weekday!"
  end
