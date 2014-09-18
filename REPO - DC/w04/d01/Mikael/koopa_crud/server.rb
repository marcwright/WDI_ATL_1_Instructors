require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/koopa_crud'

get '/' do
  @koopas = Koopa.all
  # erb :'koopa_crud/index'
  erb :home
end

 # Index Action
 # Read all of the koopas
# get '/koopas' do
#   @koopas = Koopa.all
#   erb :'koopa_crud/index'
# end

  # New Action
  # Displays a form for creating a koopa.

get '/koopas/new' do
  erb :'koopa_crud/new'
end

  # Create Action
  # Creates the koopa
post '/koopas' do
  koopa = Koopa.create({
    name: params[:name],
    color: params[:color],
    has_shell: params[:has_shell],
    photo_url: params[:photo_url]
    })
  redirect to('/koopas/' + koopa.id.to_s)
end

  # Show Action
  # Displays a single koopa

get '/koopas/:id' do
  @koopa = Koopa.find(params[:id])
  erb :'koopa_crud/show'
end

  # Edit Action
  # Displays a form to edit
get '/koopas/:id/edit' do
  @koopa = Koopa.find(params[:id])
  erb :'koopa_crud/edit'

end

  # Update Action
  # Updates the ride

patch '/koopas/:id' do
  koopa = Koopa.find(params[:id])
  koopa.update({
    name: params[:name],
    color: params[:color],
    has_shell: params[:has_shell],
    photo_url: params[:photo_url]
    })
  redirect to('/koopas/' + koopa.id.to_s)
end

  # Destroy action
  # Deletest the ride

delete '/koopas/:id' do
  koopa = Koopa.find(params[:id])
  koopa.destroy
  redirect to('/koopas')
end
# # binding.pry
