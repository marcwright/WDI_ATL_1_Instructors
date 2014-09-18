#!/usr/bin/env ruby
require "HTTParty"
require "pry"

city = ARGV[0]
state = ARGV[1]

response = HTTParty.get("http://api.wunderground.com/api/d9fb6c0ffeec65c7/conditions/q/#{state}/#{city}.json")

current_temp = response["current_observation"]["temperature_string"]
puts "THE CURRENT TEMPERATURE IS: #{current_temp}"

hourly_response = HTTParty.get("http://api.wunderground.com/api/d9fb6c0ffeec65c7/hourly/q/#{state}/#{city}.json")["hourly_forecast"]

third_hour = hourly_response.select { |hour| hourly_response.index(hour) % 3 == 0 }
third_hour.each { |hour| puts "#{hour["FCTTIME"]["civil"]} : #{hour["temp"]["english"]} degrees F - Conditions: #{hour["condition"]}" }

