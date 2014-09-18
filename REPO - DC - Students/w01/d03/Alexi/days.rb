require 'pry'

puts "Greetings! What day is it?"
day_response = gets.chomp.downcase


  def week_choice(response)
    if response == "friday"
      puts "TGIF!"
    elsif response == "tuesday"
      puts "Terrible Tuesday huh?"
    elsif response == "wednesday"
      puts "Hump day!"
    elsif response == "thursday"
      puts "Feeling good, week is almost over."
    else response == "monday"
      puts "How was your weekend?"
    end
  end

console_response = week_choice(day_response)
puts console_response

