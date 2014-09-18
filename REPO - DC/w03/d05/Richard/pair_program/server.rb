require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :main
end

get '/pass_test' do
  erb :pass_test
end

get '/min_code' do
  erb :min_code
end

get '/go_refactor' do
  erb :go_refactor
end

get '/new_feature' do
  erb :new_feature
end

get '/refactor' do
  erb :refactor
end

get '/write_test' do
  erb :write_test
end
