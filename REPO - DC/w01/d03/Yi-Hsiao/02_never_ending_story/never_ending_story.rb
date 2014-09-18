# ## Never Ending Story

# Oh no, we have a recursive story! Open `never_ending_story.rb` and do the following:

# * Write a program that prints out a story line, and then prompts:
#   * **"Should we continue? (y/n)"**
#   * If "n", use `break` to exit.
#   * If "y", print the next line of the story.
# * Do this indefinitely until the user chooses to stop.
# * Loop the story back to the beginning when you run out of story lines!

story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
  'Fry encounters his grandmother, then inadvertently sires his father'
]

num_lines = story.length
story_time = true
story.cycle do |i|
  puts i
  puts "Should we continue? (Y/N)"
  puts
  break if gets.chomp.downcase == "n"
end
