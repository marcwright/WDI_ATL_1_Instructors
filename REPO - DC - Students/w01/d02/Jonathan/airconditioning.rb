puts = "What is the current temperature?"
temperature = gets.to_i
puts = "Is the AC unit functional?"
functional = gets.chomp.downcase
puts = "What temperature would you like it to be?"
ideal_temp = gets.to_i

if functional == "Yes" && temperature > ideal_temp
  puts "Turn on the AC please!"
end

if temperature == "No"
  then temperature = false
elsif functional == "no" && temperature >= ideal_temp
  puts "Fix the AC! I am really hot!"
elsif functional == "no"
  puts "Fix the AC if you want to. It\'s cool"
else puts "everything is swell"
end



# if case temperature + functional = true
#   puts = "Turn on the AC please!"
# else
#   puts = "Fix the AC now! It's hot"
# end
