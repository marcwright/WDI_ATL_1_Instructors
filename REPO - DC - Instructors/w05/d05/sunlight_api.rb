require 'pry'
require 'httparty'

def get_handles
  response = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?apikey=72b1947e66094b0cab4d47fe960ce58f")
end

response = get_handles()

results = response["results"]

twitter_handles = results.map do |object|
  object["twitter_id"]
end
binding.pry

HTTParty.get("https://api.twitter.com/1.1/statuses/user_timeline.json?count=1&screen_name=RepSanfordSC")

curl --get 'https://api.twitter.com/1.1/statuses/user_timeline.json' --data 'count=1&screen_name=RepSanfordSC' --header 'Authorization: OAuth oauth_consumer_key="S12lQzOjHuLbRCOrM6WamjMdO", oauth_nonce="8ec9f331894900dd1dbc230a16a30735", oauth_signature="ulGmJMl4q%2BLxO67OmISM2Bb9mnk%3D", oauth_signature_method="HMAC-SHA1", oauth_timestamp="1400804474", oauth_token="", oauth_version="1.0"'

class Sunlight
  include HTTParty
  base_uri 'https://api.twitter.com/1.1/statuses/user_timeline.json'
  headers "
  basic_auth 'username', 'password'

end
