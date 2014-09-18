puts "what score?"
score = gets.chomp.to_i

puts case score
  when 10
    "genius"
  when 8..9
    "merit"
  when 5..7
    "pass"
  else # default value is optional... without this it would return nil
    "fail"
end

