
story = 
[
  'Fry is born without a delta brainwave', #0
  'As a result, Fry is cryogenically frozen until 2999', #1
  'In the future, Fry works on a spaceship', #2
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM', #3
  'Fry encounters his grandmother, then inadvertently sires his father' #4
]

# puts "Do you want to continue the story? Type 
# \'y(es)\' to continue or \"(q)uit\" to exit."
# input = gets.chomp.downcase

# while true
#   break if input == "quit"
#     def story(counter) 
#       put "#{story[0..4]}"
#     end
#   end
# end


index = 0
while true
  puts "#{story[index]}"
  puts "Would you like to continue the story (Y/N)?"
  choice = gets.chomp.downcase

    if choice.include? 'y'
      index = (index + 1) % story.length
      #array index = wherever we are + 1
    else
      break
    end
end
puts "The story ended."
