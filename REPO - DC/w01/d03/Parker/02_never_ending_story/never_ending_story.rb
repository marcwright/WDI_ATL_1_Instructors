# # story = [
#   'Fry is born without a delta brainwave',
#   'As a result, Fry is cryogenically frozen until 2999',
# #   'In the future, Fry works on a spaceship',
# #   'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
#   'Fry encounters his grandmother, then inadvertently sires his father'
# ]

# names = []

# while true
#   puts "#{names.length} so far. Enter a student name, or type 'done':"
#   name = gets.chomp

#   break if name == "done"
#   names.push(name)
# end

# puts "You collected #{names.length} student names."
# puts "The names are: #{names.join(', ')}"

# ## Never Ending Story

# Oh no, we have a recursive story! Open `never_ending_story.rb` and do the following:

# * Write a program that prints out a story line, and then prompts:
# 	* **"Should we continue? (y/n)"**
# 	* If "n", use `break` to exit.
# 	* If "y", print the next line of the story.
# * Do this indefinitely until the user chooses to stop. 
# * Loop the story back to the beginning when you run out of story lines!

story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
  'Fry encounters his grandmother, then inadvertently sires his father'
   ]

index = 0

while true
	puts "#{story[index]}"
	puts "Should we continue the story? (yes or no?)"
	choice = gets.chomp.downcase

	if choice.include? 'Y'
		index = (index + 1) % story.length
	else 
		break
	end
end

puts "The Story is over"

