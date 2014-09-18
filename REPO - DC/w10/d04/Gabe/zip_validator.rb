a = ""
while a != "end"
  puts "Enter a zip code. Type 'end' to quit"
  a = gets.chomp
  if /^\d{5}$/.match(a) != nil || /^\d{5}[-]\d{4}$/.match(a) != nil
    puts "Valid Zip Code"
  else
    puts "INVALID"
  end
end
