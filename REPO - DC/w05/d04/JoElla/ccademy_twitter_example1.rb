require 'rubygems'
require 'oauth'
require 'json'

# Change the following values to those provided on dev.twitter.com
# The consumer key identifies the application making the request.
# The access token identifies the user making the request.
consumer_key = OAuth::Consumer.new(
    "S12lQzOjHuLbRCOrM6WamjMdO",
    "XWd9VvD60lJtwCkQh6hclxxRoMgp2jvo1eDu6Q6isqUgOk6FQi")
access_token = OAuth::Token.new(
    "260052956-RNxbZZo6Ovl7YtsrWQIYE8p2V8oLYXrq5UDgZybQ",
    "5FKY4qh8Oo0y95kBvFVxeMTDMTzudLG77tefEs8ktLT9K")

# All requests will be sent to this server.
baseurl = "https://api.twitter.com"

# The verify credentials endpoint returns a 200 status if
# the request is signed correctly.
address = URI("#{baseurl}/1.1/account/verify_credentials.json")

# Set up Net::HTTP to use SSL, which is required by Twitter.
http = Net::HTTP.new address.host, address.port
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

# Build the request and authorize it with OAuth.
request = Net::HTTP::Get.new address.request_uri
request.oauth! http, consumer_key, access_token

# Issue the request and return the response.
http.start
response = http.request request
puts "The response status was #{response.code}"

def print_tweet(tweet)
    # ADD CODE TO PRINT THE TWEET IN "<screen name> - <text>" FORMAT
    tweet_text = tweet["text"]
    puts tweet_text
  end


tweet = nil
if response.code == '200' then
  tweet = JSON.parse(response.body)
  print_tweet(tweet)
else
  puts response.code
end
