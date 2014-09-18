require "pry"
require_relative "weatherUndergroundAPI.rb"

def main
  location = get_location_from_args
  api = WeatherUndergroundAPI.new location[:city], location[:state]
  get_and_print_hourly_forecast api
end

# get location from command line arguments
# expects the command line argument in the format:
# city, state abbrev.
def get_location_from_args
  location = ARGV.join(" ").split(", ")
  Hash[[:city, :state].zip(location)]
end

def get_and_print_temp api
  current_temp = api.get_temperature
  puts "The current temperature is #{current_temp} for #{api.city}, #{api.state}."
end

def get_and_print_hourly_forecast api
  forecast = api.get_hourly_forecast
  puts forecast
end

main