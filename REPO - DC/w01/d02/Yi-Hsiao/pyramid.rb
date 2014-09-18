# # Simple ASCII Art

# * Ask the user for a character
# * Ask the user for the number of rows in the pyramid
# * Print out a simple ASCII art pyramid

# ![](pyramid.png)

# ### Bonus

# * Ask the user if they want their pyramid upside-down and print it the way that they want it.
# require "pry"

def get_rows
  # prompts a user for the number of rows on their pyramid
  # expects a positive integer
  # repeat question if user enters wrong input

  puts "How many rows do you want on your triforce?"
  response = gets.chomp
  if response =~ /^[0-9]+$/ && response.to_i > 0
    response.to_i
  else
    puts "Sorry, please put a positive integer in."
    get_rows
  end
end

# def affirmative? question
#   poss_answers = ["Y", "N"]
#   puts "#{question} (Y/N)?"

#   reply = gets.chomp.upcase
#   if poss_answers.include? reply
#     reply == poss_answers.first ? true : false
#   else
#     puts "Sorry, I didn't understand you."
#     affirmative? question, poss_answers
#   end
# end

def build_pyramid block, height, width, point_on_top
  pyramid = []
  height.times do |i|
    j = point_on_top ? i : height - i - 1
    pyramid << ( (block * (2*j + 1)).center width )
  end
  return pyramid
end

def find_neg_space neg_tf, neg_block
  neg_map = []
  neg_tf.each_with_index do |row, row_num|
    map_row = []
    row.chars.each_with_index do |char, position|
      ( map_row << position ) if char == neg_block
    end
    neg_map << map_row
  end
  return neg_map
end

def add_neg_space pos_tf, neg_map
  triforce = []
  neg_map.each_with_index do |map_row, row_num|
    tf_row = pos_tf[row_num].chars.to_a
    map_row.each { |i| tf_row[i] = " " }
    triforce << tf_row.join("")
  end
  return triforce
end

def build_triforce block, max_height
  # height of one piece of the triforce
  max_height -= 1 if max_height.odd?
  part_height = max_height / 2
  width = 2*max_height + 1

  # calculate negative space in triforce
  neg_block = block.next
  neg_triforce = build_pyramid neg_block, part_height, width, false
  pos_triforce = build_pyramid block, max_height, width, true
  neg_triforce.unshift [''] * (max_height - part_height)
  neg_triforce.flatten!
  neg_map = find_neg_space neg_triforce, neg_block

  # add negative space to pyramid to create triforce
  triforce = add_neg_space pos_triforce, neg_map
end

def main
  puts "Which character would you like to build your triforce with?"
  block = gets.chr
  height = get_rows
  # pointy_top = affirmative? "Do you want the point on top"
  # pyramid = build_pyramid block, height, pointy_top
  build_triforce block, height
end

puts main
