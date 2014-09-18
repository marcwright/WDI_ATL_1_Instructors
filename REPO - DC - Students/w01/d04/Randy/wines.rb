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

# puts "What type of wine would you like to add?"
# type_response = gets.chomp
# wine_cellar.push({:type => type_response})


white_wines = wine_cellar.select do |wine|
  wine[:color] == "white"
end
puts "White wine time ------> #{white_wines}"

# wine_type = wine_cellar.map do |wine_type|
#   wine_type[:type]
# end
# puts wine_type.unique

two_word_label = wine_cellar.select do |wine|
  wine[:label].include?(" ")
end
puts two_word_label

pinot_noirs = wine_cellar.select do |wine|
    wine.has_value?("Pinot Noir")
  end
  pinot_noirs_labels = pinot_noirs.map do |wine|
    wine[:label]
  end
puts pinot_noirs_labels



#puts "Random Wine Time ----> #{wine_cellar.sample}"























#puts wine_cellar
# Write code that:
#   - Adds a wine of your choice to the cellar
#   - Returns a random wine from the cellar
#   - Returns an array of just the white wines
#   - Returns an array listing the unique types of wine
#   - Returns an array with the all the wines that have 2-word labels
#   - Returns an array with the labels of the wines that a type of Pinot Noir