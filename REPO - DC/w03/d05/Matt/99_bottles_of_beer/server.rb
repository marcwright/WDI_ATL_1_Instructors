require 'sinatra'
require 'sinatra/reloader'

get "/" do
  erb :index
end

get '/verse/:bottles' do

  @bottles = params[:bottles].to_i

  if @bottles >= 0
    @plural = @bottles >1
    erb :verse
  else
    redirect "/"
  end
end

get '/refrain/:bottles' do
  @bottles = params[:bottles].to_i
  @next = @bottles - 1
  @no_beer = @bottles <= 0
  erb :refrain
end
