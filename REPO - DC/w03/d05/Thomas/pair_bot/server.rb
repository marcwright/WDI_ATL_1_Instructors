require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/test_pass' do
  erb :test_pass
end

get '/write_test' do
  erb :write_test
end

get '/refactor' do
  erb :refactor
end

get '/refactor_do' do
  erb :refactor_do
end

get '/select_new' do
  erb :select_new
end

get '/role' do
  erb :role
end

