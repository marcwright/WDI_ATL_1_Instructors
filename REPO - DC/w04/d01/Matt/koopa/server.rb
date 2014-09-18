require 'pry'
require 'active_record'
require "sinatra"
require "sinatra/reloader"

require_relative './models/config'
require_relative './models/koopa'

# Koopa.create(name: "Bombshell Koopa", color: "black", has_shell: true, image_url: "http://i.imgur.com/ahEwt9S.png")

# @random_koopa = Koopas.id.sample

get "/" do
  @koopas = Koopa.all
  erb :'koopa/index'
  # binding.pry
end

get "/koopa" do
  @koopas = Koopa.all
  erb :'koopa/index'
end

get '/koopa/new' do
  erb :'koopa/new'
end

get '/koopa/:id' do
  @koopa = Koopa.find(params[:id])
  erb :'koopa/show'
end

get '/koopa/:id/edit' do
  @koopa = Koopa.find(params[:id])
  erb :'koopa/edit'
end

patch '/koopa/:id' do
  koopa = Koopa.find(params[:id])
  koopa.update({
    name: params[:name],
    color: params[:color],
    has_shell: params[:has_shell],
    image_url: params[:image_url]
    })
  redirect to('/koopa/' + koopa.id.to_s)
end

delete '/koopa/:id' do
  koopa = Koopa.find(params[:id])
  koopa.destroy
  redirect to('/koopa')
end

post '/koopa' do
  koopa = Koopa.create({
    name: params[:name],
    color: params[:color],
    has_shell: params[:has_shell],
    image_url: params[:image_url]
    })
  redirect to('/koopa/' + koopa.id.to_s)
end
