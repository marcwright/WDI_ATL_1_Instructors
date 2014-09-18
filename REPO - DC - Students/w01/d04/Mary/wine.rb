require 'pry'

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

#adds wine of my choice
wine_cellar.push(:label => "Vina Borgia", :type => "Cabernet", :color => "red")

#returns random wine from cellar
puts wine_cellar.sample

#returns array of white wines
wine_cellar.select do |wine|
  wine[:color] == "white"
end

#returns array of unique wine types
wine_types = wine_cellar.map do |wine|
  wine[:type]
end
wine_types.uniq

#returns array with wines that have 2-word labels
two_word_labels = wine_cellar.select do |wine|
  wine[:label].include?(" ")
end

#returns array of Pinot Noirs
pinot_noirs = wine_cellar.select do |wine|
  wine[:type] == "Pinot Noir"
end
pinot_noir_labels = pinot_noirs.map do |wine|
  wine[:label]
end



binding.pry
