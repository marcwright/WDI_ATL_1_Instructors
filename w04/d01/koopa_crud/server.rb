require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'config.rb'
require_relative 'models/koopa.rb'

# root should display all koopas, therefore we need all the koopas
get '/' do
  @koopas = Koopa.all
  erb :index
end

get '/koopas/:id' do
  @koopa = Koopa.find_by_id(params[:id])
  erb :profile
end

get '/koopas/:id/edit' do
  @koopa = Koopa.find_by_id(params[:id])
  erb :edit
end


