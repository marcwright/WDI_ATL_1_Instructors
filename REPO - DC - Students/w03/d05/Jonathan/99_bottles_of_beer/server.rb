require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/verse/:bottles' do
  @bottles = params[:bottles].to_i
  erb :verse
end

get '/refrain/:bottles' do
  @bottles = params[:bottles].to_i
  @next = @bottles - 1
  erb :refrain
end
