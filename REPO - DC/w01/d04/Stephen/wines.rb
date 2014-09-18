# Stephen Stanwood (stephen@stanwoodsolutions.com)

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

puts wine_cellar.push({:label => "Santa Cruz Mountains", :type => "Chardonnay", :color => "white"})
puts

puts wine_cellar.sample
puts

puts wine_cellar.select { |w| w[:color] == "white" }
puts

puts (wine_cellar.collect { |w| w[:type] } ).uniq
puts

puts wine_cellar.select { |w| w[:label].split.size == 2 }
puts

pinots = wine_cellar.select { |w| w[:type] == "Pinot Noir" }
puts pinots.map { |w| w[:label] }
puts
