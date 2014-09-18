require "pry"

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

#1
def add_wine(label,type,color)
  wine_cellar.push({:label => label, :type => type, :color => color})
end

add_wine("California","Pinot Noir","red")

#2
random_wine = wine_cellar[rand(wine_cellar.length)]

#3
white_wine = wine_cellar.select do |wine|
  wine[:color].include?("white")
  #need to nail down this x[:] thing...
end

#4
wine_types = wine_cellar.map do |wine| 
  wine[:type]
end
wine_types.uniq

#5
two_word_labels = wine_cellar.select do |wine|
  wine[:label].include?(" ")
end

#6
pinot_noirs = wine_cellar.select do |wine|
  wine.has_value?("Pinot Noir")
end

pinot_noir_labels = pinot_noirs.map do |wine|
  wine[:label]
end

binding.pry