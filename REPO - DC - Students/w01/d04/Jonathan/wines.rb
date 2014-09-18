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
wine_cellar.push({:label => "DC Wine", :type => "Merlot", :color => "red"})

# Returns a random wine from the cellar
wine_cellar.sample

# Returns an array of just the white wines
white_wines = wine_cellar.select do |wine|
  wine[:color] == ("white")
end

# Returns an array listing the unique types of wine
wine_types = wine_cellar.map do |wine|
  wine[:type]
end
wine_types.uniq

# Returns an array with the all the wines that have 2-word labels
two_word_labels = wine_cellar.select do |wine|
  wine[:label].include?(" ")
end

# Returns an array with the labels of the wines that a type of Pinot Noir
pinot_noirs = wine_cellar.select do |wine|
  wine.has_value?("Pinot Noir")
end

pinot_noir_labels = pinot_noirs.map do |wine|
  wine[:label]
end
