wine_cellar = 
[
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

#wine_cellar.push([label: "Lindemans", type: "Merlot", color: "white"])

wine_cellar({:label => "Lindemans", :type => "Merlot", :color => "red"})

random_wine = wine_cellar.shuffle
  puts "Random Wine: #{random_wine.first}"
#or
wine_cellar.sample

# Returns array of just white wines
white_wines = wine_cellar.select do |wine|
  wine[:color].include?("white")
end

# Unique Wines
wine_types = wine_cellar.map do |wine|
  wine[:type]
end
puts wines.uniq

two_word_labels = wine_cellar.select do |wine|
  wine[:label].include?(" ")

  # Returns array with labels taht have Pinot

pinot_noirs = wine_cellar.select do |wine|
  wine.has_value?("Pinot Noir")
end

pinot_noirs.map do |wine|
  wine[:label]
end


