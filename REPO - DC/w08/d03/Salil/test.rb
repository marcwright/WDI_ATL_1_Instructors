require 'httparty'
require 'pry'

keyword = ARGV[0]

response = HTTParty.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=#{keyword}&api-key=5ce96856728db063fcdfdeb6cd689c36:14:69482384")
response = response["response"]["docs"]
binding.pry
