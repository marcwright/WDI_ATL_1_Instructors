require 'httparty'
require 'pry'

twitter = HTTParty.get("https://api.twitter.com/1.1/statuses/mentions_timeline.json?count=20")
googeo = HTTParty.get("https://michele-zonca-google-geocoding.p.mashape.com/geocode/json?address=1600%20Amphitheatre%20Parkway%2CMountain%20View%2CCA&sensor=false&bounds=%3Cbounds%3E&language=%3Clanguage%3E&region=%3Cregion%3E")
facebook = 0

response = HTTParty.get("https://loudelement-free-natural-language-processing-service.p.mashape.com/nlp-text/?text=I%20love%20you%20baby",
  headers: {
    "X-Mashape-Authorization" => "06a02Yem9qppX7TTkqZhfvQNI9z9yC9R"
  })

holdem = HTTParty.get("https://neurone-texas-holdem.p.mashape.com/playGame/6",
  headers: {
    "X-Mashape-Authorization" => "06a02Yem9qppX7TTkqZhfvQNI9z9yC9R"
  })

coinbase = HTTParty.get("https://community-coinbase.p.mashape.com/account/generate_receive_address?api_key=%3Capi_key%3E",
  headers: {
    "X-Mashape-Authorization" => "06a02Yem9qppX7TTkqZhfvQNI9z9yC9R",
    "Content-Type" => "application/json"
  },
  parameters: "{\"api_key\":\"<api_key>\"}")

binding.pry
