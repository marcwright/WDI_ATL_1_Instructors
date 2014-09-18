require 'open-uri'
require 'json'
require 'pry'

city = ARGV[0].gsub(" ", "_")
state = ARGV[1]

open('http://api.wunderground.com/api/1378313574cf6109/geolookup/conditions/q/'+state+'/'+city+'.json') do |f|
  json_string = f.read
  parsed_json = JSON.parse(json_string)
  location = parsed_json['location']['city']
  temp_f = parsed_json['current_observation']['temp_f']
  print "Current temperature in #{location} is: #{temp_f}\n"
end

open('http://api.wunderground.com/api/1378313574cf6109/geolookup/hourly/q/'+state+'/'+city+'.json') do |f|
  json_string = f.read
  parsed_json = JSON.parse(json_string)

  hourly_forecasts = parsed_json['hourly_forecast']
   i = 0

  hourly_forecasts.each do |forecast|
    puts "At#{f['FCTTIME']['civil']} -- Temperature: #{f['temp']['english']} -- Conditions: #{f[['condition']}"  if i % 3 == 0
      i += 1
  end
end
