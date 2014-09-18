require "httparty"

class WeatherUndergroundAPI
  attr_reader :city, :state, :conditions

  API_KEY = ENV['WEATHER_UNDERGROUND_API_KEY'];
  BASE_REQUEST_URL = "http://api.wunderground.com/api/" + API_KEY

  def initialize(city, state)
    @city = city.split.join("_")  # replace spaces with underscores
    @state = state
  end

  def get_temperature
    request_url = "#{ BASE_REQUEST_URL }/conditions/q/#{ state }/#{ city }.json"
    response = HTTParty.get(request_url)
    
    # check for response and throw errors if something unexpected happens
    if !response
      raise "Did not receive a response from the API"
    elsif error = response["response"]["error"]
      err_description = error["description"]
      raise "Weather Underground API Error: #{ err_description }"
    end

    response["current_observation"]["temperature_string"]
  end

  def get_hourly_forecast
    request_url = "#{ BASE_REQUEST_URL }/hourly/q/#{ state }/#{ city }.json"
    response = HTTParty.get(request_url)
    
    # check for response and throw errors if something unexpected happens
    if !response
      raise "Did not receive a response from the API"
    elsif error = response["response"]["error"]
      err_description = error["description"]
      raise "Weather Underground API Error: #{ err_description }"
    end

    hourly_forecast = response["hourly_forecast"]
    hourly_forecast.collect do |hourly|
      temp_in_f = "#{ hourly["temp"]["english"] } F"
      condition = hourly["condition"]
      time = hourly["FCTTIME"]["civil"]

      "#{ time } : #{ temp_in_f }, #{ condition }"
    end
  end

  def get_temperature
    curr_conditions = conditions || self.get_weather_conditions
    curr_conditions["temperature_string"]
  end
end