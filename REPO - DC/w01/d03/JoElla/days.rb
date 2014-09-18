keep_playing = "Y"

while keep_playing == "Y"
  puts "Which weekday is it?"
  weekday = gets.chomp

  case weekday
  when "Monday"
    puts "Ew, Monday"
  when "Tuesday"
    puts "Sometimes this is a fat day"
  when "Wednesday"
    puts "Humpday, dorks!"
  when "Thursday"
    puts "Looking good"
  when "Friday"
    puts "Happy hour!"
  else
    puts "We\'re not interested in those days."
  end
  puts "Want to play again? (Y/N)"
  keep_playing = gets.chomp.upcase
end


