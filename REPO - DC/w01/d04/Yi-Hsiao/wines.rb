# ### Wine Cellar

# - Here is an array containing some wines

# ```ruby
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

# ```

# Write code that:
#   - Adds a wine of your choice to the cellar
wine_cellar << {
  label: "Henri Jayer Richebourg Grand Cru",
  type: "Pinot Noir",
  color: "red"
}
#   - Returns a random wine from the cellar
random_wine = wine_cellar.sample
#   - Returns an array of just the white wines
white_wines = wine_cellar.select{ |wine| wine[:color] == "white" }
#   - Returns an array listing the unique types of wine
unique_wine_types = wine_cellar.map{ |wine| wine[:type] }.uniq
#   - Returns an array with the all the wines that have 2-word labels
two_word_wine_labels = wine_cellar.select{ |wine| wine[:label].split.length == 2 }
#   - Returns an array with the labels of the wines that a type of Pinot Noir
pinot_noir_wines = wine_cellar.select{ |wine| wine[:type] == "Pinot Noir" }
