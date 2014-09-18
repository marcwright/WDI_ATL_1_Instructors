require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/clown'

get '/' do
  erb :home
end

 # Index Action
 # Read all of the clowns
get '/clowns' do
  @clowns = Clown.all
  erb :'clowns/index'
end

  # New Action
  # Displays a form for creating a clown.

get '/clowns/new' do
  erb :'clowns/new'
end

  # Create Action
  # Creates the clown
post '/clowns' do
  clown = Clown.create({
    name: params[:name],
    talent: params[:talent],
    is_creepy: params[:is_creepy],
    image_url: params[:image_url]
    })
  redirect to('/clowns/' + clown.id.to_s)
end

  # Show Action
  # Displays a single clown

get '/clowns/:id' do
  @clown = Clown.find(params[:id])
  erb :'clowns/show'
end

  # Edit Action
  # Displays a form to edit
get '/clowns/:id/edit' do
  @clown = Clown.find(params[:id])
  erb :'clowns/edit'

end

  # Update Action
  # Updates the clown

patch '/clowns/:id' do
  clown = Clown.find(params[:id])
  clown.update({
    name: params[:name],
    talent: params[:talent],
    is_creepy: params[:is_creepy],
    image_url: params[:image_url]
    })
  redirect to('/clowns/' + clown.id.to_s)
end

  # Destroy action
  # Deletest the clown

delete '/clowns/:id' do
  clown = Clown.find(params[:id])
  clown.destroy
  redirect to('/clowns')
end
# binding.pry
