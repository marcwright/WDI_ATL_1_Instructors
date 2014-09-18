require 'sinatra'
require 'sinatra/reloader'

get "/" do
  erb :pairbot_start
end

get "/refactor" do
  erb :refactor
end

get "/refactor_need" do
  erb :refactor_need
end

get "/test_pass" do
  erb :test_pass
end

get "/write_enough" do
  erb :write_enough
end

get "/write_new_feature" do
  erb :write_new_feature
end

get "/write_test" do
  erb :write_test
end

# post "/" do
#   new_compliment = params[:new_compliment]
#   @@compliments << new_compliment
# end
