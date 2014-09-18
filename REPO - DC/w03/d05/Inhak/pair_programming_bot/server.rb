require 'sinatra'
require 'sinatra/reloader'

get "/" do
  erb :test_pass
end

get"/write_code" do
  erb :write_code
end

get "/refactor" do
  erb :refactor
end

get "/do_refactor" do
  erb :do_refactor
end

get "/new_feature" do
  erb :new_feature
end
