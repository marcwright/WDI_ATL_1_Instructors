require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/verse/:bottles' do
  @num_bottles = params[:bottles].to_i
  if @num_bottles >= 0
    @plural = @num_bottles > 1
    erb :verse
  else
    redirect "/"
  end
end

get '/refrain/:bottles' do
  @bottles = params[:bottles].to_i
  @num_bottles = params[:bottles].to_i
  @plural = @num_bottles > 1
  @next = @bottles - 1
  erb :refrain
end
