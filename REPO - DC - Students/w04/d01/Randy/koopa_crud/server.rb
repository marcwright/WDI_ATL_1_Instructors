require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/koopa'

get '/' do
  @koopas = Koopa.all
  erb :home
end

get '/koopas/new' do
  erb :'/koopas/new'
end

post '/' do
  koopa = Koopa.create(name: params[:name], color: params[:color], has_shell: params[:has_shell], photo_url: params[:photo_url])
  redirect to('/koopas/' + koopa.id.to_s)
end

get '/koopas/:id' do
  @koopa = Koopa.find(params[:id])
  erb :'/koopas/index'
end

get '/koopas/:id/edit' do
  @koopa = Koopa.find(params[:id])
  erb :'/koopas/edit'
end

patch '/koopas/:id' do
  koopa = Koopa.find(params[:id])
  koopa.update(name: params[:name], color: params[:color], has_shell: params[:has_shell], photo_url: params[:photo_url])
  redirect to('/koopas/' + koopa.id.to_s)
end

delete '/koopas/:id' do
  koopa = Koopa.find(params[:id])
  koopa.destroy
  redirect to('/')
end
