puts "*yawns* What day of the week is it?"
answer = gets.chomp.downcase

case answer
when "monday"
  puts "The week starts..."
when "tuesday"
  puts "The worst day of the week!!!"
when "wednesday"
  puts "happy humpday!"
when "thursday"
  puts "so close to the weekend!"
when "friday"
  puts "thank bajeezus its Friday!"
else
  puts "it's the weekend! go have fun"
end
