require 'httparty'
require 'pry'

WUNDERGROUND_KEY = ENV['WUNDERGROUND_KEY']
city = ARGV[0]
state = ARGV[1]

current_conditions_response = HTTParty.get("http://api.wunderground.com/api/#{WUNDERGROUND_KEY}/conditions/q/#{state}/#{city}.json")
hourly_call = HTTParty.get("http://api.wunderground.com/api/#{WUNDERGROUND_KEY}/hourly/q/#{state}/#{city}.json")

hourly_breakdown = hourly_call["hourly_forecast"].first(24)
current_temp = current_conditions_response["current_observation"]["temp_f"]


hourly_breakdown.each do |hour|
  time = hour["FCTTIME"]["civil"]
  temp = hour["temp"]["english"]
  puts "At #{time} it'll be #{temp} degrees fahrenheit"
end

