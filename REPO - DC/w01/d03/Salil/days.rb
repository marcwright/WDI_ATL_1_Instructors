puts "What day of the week is it?"
days = gets.chomp.downcase

case days
  when "monday"
    puts "Oh crap"
  when "tuesday"
    puts "Slightly better than Monday"
  when "wednesday"
    puts "HUMP DAY"
  when "thursday"
    puts "One more day.."
  when "friday"
    puts "YEEAH TGIF"
  else
    "That's not a real day"
end
