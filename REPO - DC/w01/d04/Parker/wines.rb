# Write code that:
#   - Adds a wine of your choice to the cellar
#   - Returns a random wine from the cellar
#   - Returns an array of just the white wines
#   - Returns an array listing the unique types of wine
  # - Returns an array with the all the wines that have 2-word


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

wine_cellar.push({:label => "DC Wine", :type => "Merlot", :color => "Red"}
)

wine_cellar.sample

puts 
white_wines = wine_cellar.select do |wine|
	wine[:color].include? ("white")
end

puts 
wine_types = wine_cellar.map do |wine|
	wine[:type]
end

puts
two_word_labels = wine_cellar.select do |wine|
	wine[:label].include?(" ")
end

puts 
pinot_noirs = wine+cellar.select do |wine|
	wine.has_value?("Pinot Noir")
end
