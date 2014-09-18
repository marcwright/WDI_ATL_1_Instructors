require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Establish database connection:
ActiveRecord::Base.establish_connection('postgres://localhost/koopas_db')

# Establish Student model:
class Koopa < ActiveRecord::Base
end

get '/' do
  @koopas = Koopa.all
  erb :index
end

post '/koopas' do
  koopa = Koopa.create({
    name: params[:name],
    color: params[:color],
    has_shell: params[:has_shell],
    photo_url: params[:photo_url]
  })

  redirect '/'
end

get '/koopas/new' do
  @koopa = Koopa.new
  erb :new
end

get '/koopas/:id/edit' do
  @koopa = Koopa.find(params[:id])
  erb :edit
end

get '/koopas/:id' do
  @koopa = Koopa.find(params[:id])
  erb :show
end

patch '/koopas/:id' do
  koopa = Koopa.find(params[:id])
  koopa.update({
    name: params[:name],
    color: params[:color],
    has_shell: params[:has_shell],
    photo_url: params[:photo_url]
  })
  redirect "/koopas/#{koopa.id}"
end

delete '/koopas/:id' do
  koopa = Koopa.find(params[:id])
  koopa.destroy
  redirect '/'
end
