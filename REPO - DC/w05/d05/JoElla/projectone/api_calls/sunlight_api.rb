require 'pry'
require 'httparty'
require 'json'

def get_handles
  response = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?apikey=72b1947e66094b0cab4d47fe960ce58f&per_page=all")
end

response = get_handles()

results = response["results"]

twitter_handles = results.map do |object|
  object["twitter_id"]
end
binding.pry





