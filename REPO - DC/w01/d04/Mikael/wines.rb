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

def add_wine(cellar,label,type,color)
  return cellar.push({:label => label, :type => type, :color => color})
end

def random_wine(cellar)
  return cellar.sample
end

def white_wines(cellar)
  whites = cellar.select do |wine|
    wine[:color].eql?("white")
  end
  return whites
end

def list_types(cellar)
  types = cellar.map do |wine|
    wine[:type]
  end
  return types.uniq
end

two_word_labels = wine_cellar.select do |wine|
  wine[:label].include?(" ")
end

pinot_noirs = wine_cellar.select do |wine|
  wine.has_value?("Pinot Noir")
end

pinot_noirs_labels = pinot_noirs.map do |wine|
  wine[:label]
end

binding.pry
