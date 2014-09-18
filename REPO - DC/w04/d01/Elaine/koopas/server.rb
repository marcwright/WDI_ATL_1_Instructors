require 'active_record'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/koopa'

get '/' do
  erb :home
end

# Index Action
# Read all of the clowns
get '/koopas' do
  @koopas = Koopa.all
  erb :'koopas/index'
end

# New Action
# Displays a form for creating a clown
get '/koopas/new' do
  erb :'koopas/new'
end

# Create Action
# Creates the clown
post '/koopas' do
  koopa = Koopa.create(
  {
    name: params[:name],
    color: params[:color],
    has_shell: (params[:has_shell] || false),
    photo_url: params[:photo_url]
  })
  redirect to('/koopas/' + koopa.id.to_s)
end

# Show Action
# Displays a single clown
get '/koopas/:id' do
  @koopa = Koopa.find(params[:id])
  erb :'koopas/show'
end


# Edit Action
# Displays a form to Edit
get '/koopas/:id/edit' do
  @koopa = Koopa.find(params[:id])
  erb :'koopas/edit'
end

# Update Action
# Updates the clown
patch '/koopas/:id' do
  koopa = Koopa.find(params[:id])
  koopa.update({
    name: params[:name],
    color: params[:color],
    has_shell: (params[:has_shell] || false),
    photo_url: params[:photo_url]
  })
  redirect to('/koopas/' + koopa.id.to_s)
end

# Destroy Action
# Deletes the Clown
delete '/koopas/:id' do
  koopa = Koopa.find(params[:id])
  koopa.destroy
  redirect to('/koopas')
end

