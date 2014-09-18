require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/roller_coaster'
require_relative './models/config'

get '/' do
  erb :home
end

get '/roller' do
  @roller = RollerCoaster.all
  erb :'rollercoaster/index'
end
