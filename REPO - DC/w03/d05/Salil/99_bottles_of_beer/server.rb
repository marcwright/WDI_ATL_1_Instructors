require 'sinatra'
require 'sinatra/reloader'


get '/' do
  erb :index
end


get '/verse/:bottles' do
  @bottles = params[:bottles].to_i
  if @bottles >= 0
    @plural = @bottles != 1
    erb :verse
  else
    redirect "/"
  end
end

get '/refrain/:bottles' do
  @bottles = params[:bottles].to_i
  if @bottles >= 0
    @next = @bottles - 1
    erb :refrain
  else
    redirect "/"
  end
end
