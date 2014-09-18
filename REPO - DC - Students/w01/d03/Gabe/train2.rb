red = ['Woodley Park', 'Dupont Circle', 'Farragut North', 'Metro Center', 'Union Station']
turquoise = ['Crystal City', 'Metro Center', 'Shaw-Howard', 'Beltwater']
orange = ['Farragut West', 'McPherson Sq', 'Metro Center', 'Federal Triangle', 'Smithsonian', "L'enfant Plaza"]

dc_metro = {}
dc_metro[:red] = red
dc_metro[:turquoise] = turquoise
dc_metro[:orange] = orange

a = dc_metro.empty?
b = dc_metro.has_key?(:red)
c = dc_metro.has_value?(1)

d = dc_metro.merge({red: 'Woodley Park'})
e = dc_metro.merge({red: 'Federal Triangle'})

f = dc_metro.keys
g = dc_metro.values

puts a
puts b
puts c
puts d
puts e
puts f
puts g