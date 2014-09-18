require 'sinatra'
require 'sinatra/reloader'


# controller:
get '/' do
  erb :index #layout will yield to index.erb
end

get '/verse/:bottles' do
  @bottles = params[:bottles].to_i
  if @bottles >= 0
    @plural = @bottles > 1
    erb :verse #layout will yield to verse.erb
  else
    redirect '/'
  end
end

get '/refrain/:bottles' do
  @bottles = params[:bottles].to_i
  @next = @bottles - 1
  @plural = @bottles > 1
  erb :refrain
end
