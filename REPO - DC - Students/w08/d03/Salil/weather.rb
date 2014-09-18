require 'httparty'
require 'pry'

def get_weather(city, state)
  city = city.gsub(" ", "_")
  state = state
  response = HTTParty.get("http://api.wunderground.com/api/58b3aa2a06850f1e/conditions/q/#{state}/#{city}.json")
  return response["current_observation"]["temp_f"]
end

def get_hourly_weather(city, state)
  city = city.gsub(" ", "_")
  state = state
  response = HTTParty.get("http://api.wunderground.com/api/58b3aa2a06850f1e/hourly/q/#{state}/#{city}.json")
  return response["hourly_forecast"]
end

state = ARGV[1]
city = ARGV[0]

temp = get_weather(city, state)
puts "THE CURRENT TEMPERATURE IS: #{temp} DEGREES F"

hourly = get_hourly_weather(city, state)
hourly.each do |hour|
  time = hour["FCTTIME"]["civil"]
  temp = hour["temp"]["english"]
  puts time + ": " + temp + " DEGREES F"
end





