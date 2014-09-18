##############################################
#!/usr/bin/ruby
# @Author: Richard Hessler
# @Date:   2014-06-11 09:22:24
# @Last Modified by:   Richard Hessler
# @Last Modified time: 2014-06-11 10:30:00
##############################################
require 'open-uri'
require 'json'
require 'pry'

def print_current_weather(city,location)
  city = city.gsub(" ", "_")
  location = location.gsub(" ", "_")
  open('http://api.wunderground.com/api/045d1bc8957e3667/geolookup/conditions/q/location/city.json') do |f|
    json_string = f.read
    parsed_json = JSON.parse(json_string)
    location = parsed_json['location']['city']
    temp_f = parsed_json['current_observation']['temp_f']
    puts "Current temperature in #{location} is: #{temp_f}\n"
  end
end

def print_weather(city,location)
  city = city.gsub(" ", "_")
  location = location.gsub(" ", "_")
  c = 0
  open('http://api.wunderground.com/api/045d1bc8957e3667/geolookup/hourly/q/location/city.json') do |f|
    json_string = f.read
    new_parsed_json = JSON.parse(json_string)
    hourly_parsed_json = new_parsed_json['hourly_forecast']
    hourly_parsed_json.each_with_index do |json, index|
      hourly =  json['FCTTIME']['pretty']
      temp = json['temp']['english']
      puts "The temperature will be #{temp} degrees at #{hourly}"
      end
  end
end

city = ARGV[1]
location = ARGV[0]


print_weather(city,location)
print_current_weather(city,location)
