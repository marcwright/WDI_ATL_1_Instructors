require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/clown'



get '/' do
  erb :home
end

################## LIST ALL CLOWNS
get '/clowns' do #lists clowns and their talents
  @clowns = Clown.all
erb :'clowns/index'
end

################# CREATE A NEW CLOWN
get '/clowns/new' do #gets the form to submit a new clown
erb :'clowns/new'
end

post '/clowns' do # submits the created clown
Clown.create({name: params[:name], talent: params[:talent],
  is_creepy: params[:is_creepy], image_url: params[:image_url]})
end


##############  DISPLAY A SINGLE CLOWN
get '/clowns/:id' do #displays a single clown, based on url
  @clown = Clown.find(params[:id])
  erb :'clowns/show'
end

##########  EDIT A CLOWN
get '/clowns/:id/edit' do #gets the form to EDIT a new clown
@clown = Clown.find(params[:id])
erb :'clowns/edit'
end

patch '/clowns/:id' do # submits the edited clown
clown = Clown.find(params[:id])
clown.update({name: params[:name], talent: params[:talent],
  is_creepy: params[:is_creepy], image_url: params[:image_url]})
end

############## DESTROY

delete '/clowns/:id' do
  clown = Clown.find(params[:id])
  clown.destroy
 redirect to('/clowns')
end
