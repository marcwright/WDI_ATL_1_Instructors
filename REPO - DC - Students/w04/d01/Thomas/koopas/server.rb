require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'

require_relative "./models/koopa"
require_relative "./models/config"


get '/' do
  @koopas = Koopa.all
  erb :index
end

#the below was not working when it was under /koopas/:id wtf?
get '/koopas/new' do
  erb :'koopas/new'
end

#why do we need to put params[:id] below and not just [:id]?
get '/koopas/:id' do
  @koopas = Koopa.find(params[:id])
  erb :'koopas/show'
end

post '/koopas' do
    koopa = Koopa.create({
      name: params[:name],
      color: params[:color],
      has_shell: params[:has_shell],
      photo_url: params[:photo_url]
    })
  redirect to('/koopas/' + koopa.id.to_s)
end

get '/koopas/:id/edit' do
  @koopas = Koopa.find(params[:id])
  erb :'koopas/edit'
end

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

delete '/koopas/:id' do
  koopa = Koopa.find(params[:id])
  koopa.destroy
  redirect to('/')
end
