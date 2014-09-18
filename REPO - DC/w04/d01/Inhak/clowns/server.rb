require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative "./models/clown"
require_relative "./models/config"

get "/" do
  erb :index
end

##index action, will read all the clowns.
get '/clowns' do
  @clowns = Clown.all
  erb :'clowns/index'
end

#New Action
#Displays a form for creating a clown
get "/clowns/new" do
  erb :'clowns/new'
end

post '/clowns' do
  clown = Clown.create(
    name: params[:name],
    talent: params[:talent],
    is_creepy: params[:is_creepy],
    image_url: params[:image_url]
  )
  redirect to('/clowns/' + clown.id.to_s)
end

#show action
#displays a form to edit
get '/clowns/:id' do
  @clown = Clown.find(params[:id])
  erb :'clowns/show'
end

#edit action
#displays a form to edit
get '/clowns/:id/edit' do
  @clown = Clown.find(params[:id])
  erb :"clowns/edit"
end

patch '/clowns/:id' do
  @clown = Clown.find(params[:id])
  @clown.update(
    name: params[:name],
    talent: params[:talent],
    is_creepy: (params[:is_creepy] || false),
    image_url: params[:image_url]
  )
end

#destory action
#deletes the clown
delete '/clowns/:id' do
  clown = Clown.find(params[:id])
  clown.destroy
  redirect to('/clowns')
end
