#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-06-11 09:30:47
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-06-11 10:14:50

require 'pry'
require 'HTTParty'

city = ARGV[0]
city = city.gsub(' ','_')
state = ARGV[1]

response = HTTParty.get("http://api.wunderground.com/api/ad189a4cbdfe44dc/hourly/q/#{ state }/#{ city }.json")
# TESTING: puts "http://api.wunderground.com/api/ad189a4cbdfe44dc/hourly/q/#{ state }/#{ city }.json"

i = 0;

response["hourly_forecast"].each do |r|
  time = r["FCTTIME"]["pretty"]
  temp = r["temp"]["english"]
  condition = r["condition"]

  puts " #{ time }: #{ condition }, #{ temp }°F" if (i % 3 == 0)
  i += 1;
end
