require 'twitter'
require 'pry'
require 'httparty'
require 'json'

@client = Twitter::REST::Client.new do |config|
  config.consumer_key = 'vkSO6FNqJHy0vNwOwoc1F8bkU'
  config.consumer_secret = 'GTC0wCHToAySkiaQuVNZDciTd8Lv3leutBpsQp0uipMLc8b46l'
  config.access_token = '260052956-aAcvbzbYNdisIBNuTMvED4C6UXxaRUpvXENWpNxM'
  config.access_token_secret = 'bVUr0E2YVIBmnNeQU81AyEJttQf2PpmrdpjPibJoG0EoW'
end

def get_my_tweet
  @my_tweet_text = @client.user_timeline.sample.text
end

#Here you have to pass your client info, because that's how Twitter receives your authentication tokens.
#You have to pass the client for authentication, and the twitterhandle you want to work on
def get_politician_tweet(client, twitter_handle)
  client.user_timeline(twitter_handle).sample.text
end

def get_handles
  response = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?apikey=72b1947e66094b0cab4d47fe960ce58f&per_page=all")
end

response = get_handles()

results = response["results"]

twitter_handles = results.map do |object|
  object["twitter_id"]
end


random_pol = twitter_handles.sample

puts get_politician_tweet(@client, random_pol)
puts random_pol






