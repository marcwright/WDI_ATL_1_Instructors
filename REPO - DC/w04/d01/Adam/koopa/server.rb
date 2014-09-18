require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/koopa'

Koopa.create(name: "Johnny")
Koopa.create(name: "Sam")


# displays all koopas
get '/' do
  @koopas = Koopa.all
  erb :'koopa/index'
end

#displays form to create koopa
get '/koopa/new' do
  erb :'koopa/new'
end

# creates koopa
post '/koopas' do
  koopa = Koopa.create({
    name: params[:name],
    color: params[:color],
    has_shell: params[:has_shell],
    photo_url: params[:photo_url]
    })
    redirect to('/koopas/' + koopa.id.to_s)
  end

# display a single koopa
get '/koopas/:id' do
  @koopa = Koopa.find(params[:id])
  erb :'koopa/show'
end

# edit a koopa
get '/koopas/:id/edit' do
  @koopa = Koopa.find(params[:id])
  erb :'koopa/edit'
end

#updates the koopa
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

#delete the koopa
delete '/koopas/:id' do
  koopa = Koopa.find(params[:id])
  koopa.destroy
  redirect to('/')
end
