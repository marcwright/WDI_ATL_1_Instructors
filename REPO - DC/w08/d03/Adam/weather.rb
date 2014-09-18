require 'open-uri'
require 'json'
require 'pry'

v1 = ARGV[0]
v2 = ARGV[1]
puts v1
puts v2

binding.pry


open('http://api.wunderground.com/api/66e3437973b14a1a/geolookup/conditions/q/IA/Cedar_Rapids.json') do |f|
  json_string = f.read
  parsed_json = JSON.parse(json_string)
  location = parsed_json['location']['city']
  temp_f = parsed_json['current_observation']['temp_f']
  print "Current temperature in #{location} is: #{temp_f}\n"
end


