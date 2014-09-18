require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'tweetstream'

  TweetStream.configure do |config|
    config.consumer_key       = 'HFJtymOEjQ6mc9FASGDXyp2KS'
    config.consumer_secret    = 'wZAVQLDSIVyoiogZn1owCIs0inuryp6whAtl6BdzTHcaQx4f93'
    config.oauth_token        = '300381691-gTe1rOB3UxjtaaP0WBoACcIUXj5mt2czfguX0KrB'
    config.oauth_token_secret = 'Kgp4Z4iojtjXiEQO6n1toHVHtKMS9D44SowfkAJDjL7le'
    config.auth_method        = :oauth
  end


get '/' do

  # This will pull a sample of all tweets based on
  # your Twitter account's Streaming API role.
  #TweetStream::Client.new.sample do |status|
  # The status object is a special Hash with
  # method access to its keys.
  #  puts "#{status.text}"
  #end

  erb :index
end
