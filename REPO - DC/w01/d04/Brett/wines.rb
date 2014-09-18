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

# Adds a wine of your choice to the cellar

puts = "Add random wine:"
wine_cellar.push({:label => "DC", :type => "Malbec", :color => "red"})

# Returns a random wine

puts "Random wine:"
puts wine_cellar.sample

# Returns an array of just the white wines
puts "White wines:"
puts wine_cellar.select { |wine| wine[:color] == "white" }

# Returns an array listing the unique types of wine

puts "Unique types of wine:"
wine_types = wine_cellar.map { |wine| wine[:type] }
puts wine_types.uniq

# Returns an array with all the wines that have 2-word labels

puts "Wines that have two word labels"
two_word_labels = wine_cellar.select do |wine|
  wine[:label].include?(" ")
end

puts two_word_labels

# Returns an array with the labels of the wines that a type of Pinot Noir
puts "Labels of wines that are a type of Pinot Noir:"
pinot_noirs = wine_cellar.select { |wine| wine[:type] == "Pinot Noir" }
pinot_noir_labels = pinot_noirs.map { |wine| wine[:label] }
puts pinot_noir_labels
