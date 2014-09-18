### Wine Cellar

# - Here is an array containing some wines


wine_cellar = [
  {:label => "Rutherford Hill", :type => "Chardonnay", :color => "white"},
  {:label => "Nina Veneto", :type => "Pinot Grigio", :color => "white"},
  {:label => "Wairau River", :type => "Sauvignon Blanc", :color => "white"},
  {:label => "Tangley Oaks", :type => "Merlot", :color => "red"},
  {:label => "Chimney Rock", :type => "Cabernet Sauvignon", :color => "red"},
  {:label => "Sanford", :type => "Pinot Noir", :color => "red"},
  {:label => "Alderbrook", :type => "Pinot Noir", :color => "red"},
  {:label => "Colavita", :type => "Pinot Noir", :color => "red"},
  {:label => "Markham", :type => "Chardonnay", :color => "white"},
  {:label => "Angeline", :type => "Pinot Noir", :color => "red"}
]



# Write code that:
#   - Adds a wine of your choice to the cellar
#   - Returns a random wine from the cellar
#   - Returns an array of just the white wines
#   - Returns an array listing the unique types of wine
#   - Returns an array with the all the wines that have 2-word labels
#   - Returns an array with the labels of the wines that a type of Pinot Noir

puts "Would you like to add a bottle to your cellar? yes or no"
choice = gets.chomp.downcase

if choice.include? "y"
  hash = {}
  puts "Who is the Producer?"
  producer = gets.chomp.to_s
  hash[:label] = producer
  puts hash

  puts "What is the grape?"
  grape = gets.chomp.to_s
  hash[:type] = grape

  puts "What is the color of wine?"
  color = gets.chomp.to_s
  hash[:color] = color

  wine_cellar.push(hash)
  puts wine_cellar
end

puts "Ok, no new wine... How about a random bottle? Yes or no?"
choice2 = gets.chomp.downcase
  if choice2.include? "y"
    puts wine_cellar.sample
  end

puts "Here is all of our whites!"

puts white_wine = wine_cellar.select {|wine| wine[:color].include? 'white'}

puts "here are our unique wine types!"
puts unique_wine = wine_cellar.uniq {|wine| wine[:type]}

puts "Spaces between label names!"
puts two_word_labels = wine_cellar.select {|wine| wine[:label].include?(" ")}

#   - Returns an array with the labels of the wines that a type of Pinot Noir

puts "And our pinot!"

puts pinot_noirs = wine_cellar.select {|wine| wine.has_value?("Pinot Noir")}
puts pinot_noirs.map {|label| label[:label]}
