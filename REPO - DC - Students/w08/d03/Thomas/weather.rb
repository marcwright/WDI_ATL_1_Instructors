require 'httparty'
require 'uri'

response = HTTParty.get('http://api.wunderground.com/api/b8ca8ce87e1991ab/geolookup/conditions/q/' + ARGV[1] + '/' + URI.encode(ARGV[0]) + '.json')
  location = response['location']['city']
  temp_f = response['current_observation']['temp_f']
  print "Current temperature in #{location} is: #{temp_f}\n"
