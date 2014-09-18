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
wine_cellar.push({:label => "Arbitrary Wine", :type => "Good", :color => "red"})

wine_cellar.sample

white_array = []
wine_cellar.each do |wine|
  if wine.has_value?("white")
    white_array.push(wine)
  end
end
puts white_array

#unique types of wine
wine_types = wine_cellar.map do |wine|
  wine[:type]
end
wine_types.uniq

#two-word labels
two_word_labels = wine_cellar.select do |wine|
  wine[:label].include?(" ")
end

#only Pinot Noir
pinot_noir_array = wine_cellar.select do |wine|
  wine.has_value?("Pinot Noir")
end
pinot_noir_labels = pinot_noir_array.map do |wine|
  wine[:label]
end
