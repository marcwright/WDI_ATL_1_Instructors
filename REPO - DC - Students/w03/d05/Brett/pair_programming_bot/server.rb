require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/pass' do
  erb :pass
end

get '/refactor' do
  erb :refactor
end

get '/do_refactor' do
  erb :do_refactor
end

get '/write_code' do
  erb :write_code
end
