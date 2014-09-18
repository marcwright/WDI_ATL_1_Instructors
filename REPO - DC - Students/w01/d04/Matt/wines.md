### Wine Cellar

- Here is an array containing some wines

```ruby
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

```

Write code that:
  - Adds a wine of your choice to the cellar
  wine_cellar.push({ :label => "Franz", :type => "Jug", :color => "Whiteish" })
  - Returns a random wine from the cellar
  wine_cellar.sample(1)
  - Returns an array of just the white wines

  red_wines = wine_cellar.select do |wine|
    wine[:color].include?('red')
  end
  - Returns an array listing the unique types of wine

  wine_types = wine_cellar.map do |unique|
    unique[:type]
  end
  puts wine_types.uniq

  - Returns an array with the all the wines that have 2-word labels
  red_wines = wine_cellar.select do |space|
    space[:label].include?(' ')
  end
  - Returns an array with the labels of the wines that a type of Pinot Noir

pinot_noir = wine_cellar.select do |wine|
  wine.has_value?('Pinot Noir')
end

pinot_noir_labels = pinor_noirs.map dp |wine|
  wine[:label]
end
