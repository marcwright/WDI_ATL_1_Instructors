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

def add_wine(array, label, type, color)
  array.each do |this|
    this[:label] = label
    this[:type] = type
    this[:color] = color
  end
end

random_wine = wine_cellar.sample
puts random_wine

white_wines = wine_cellar.select do |wine|
  wine[:color] == "white"
end
puts white_wines

uniques = wine_cellar.map{|wine| do wine[:types]}.uniq

two_word_labels = win_cellar.select do |wine|
  wine[:label].include?(" ")
end

pinot_noir = wine_cellar.select do |wine|
  wine[:type] == "Pinot Noir"
end

pinot_noirs.map { |wine| wine[:label] }
