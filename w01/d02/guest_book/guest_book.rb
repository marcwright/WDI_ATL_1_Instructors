guest_list = "Peter"

puts "Hello and welcome to WDI!"
puts "Enter your choice below:"
puts "(S)ign the guestbook"
puts "(V)iew the guestbook"
puts "(Q)uit"
response = gets.chomp.upcase

while response != 'Q'

  if response == "S"
    puts "What is your name?"
    guest_list += ", #{gets.chomp}"
  else
    puts "Here's who's been here so far"
    puts guest_list
  end

  puts "Hello and welcome to WDI!"
  puts "Enter your choice below:"
  puts "(S)ign the guestbook"
  puts "(V)iew the guesbook"
  puts "(Q)uit"
  response = gets.chomp.upcase
end