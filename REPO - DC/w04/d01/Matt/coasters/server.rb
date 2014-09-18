require 'pry'
require 'active_record'
require "sinatra"
require "sinatra/reloader"

require_relative './models/config'
require_relative './models/coaster'

# Coaster.create(name: "Safe Space", speed: 350, height_requirement: 38, image_url: "http://i.imgur.com/Z8OFvyi.jpg")

get "/" do
  erb :coaster
  # binding.pry
end

get "/coasters" do
  @coasters = Coaster.all
  erb :'/coasters/index'
end

get '/coasters/new' do
  erb :'/coasters/new'
end

get "/coasters/:id" do
  @coaster = Coaster.find(params[:id])
  erb :'/coasters/show'
end

get '/coasters/:id/edit' do
  @coaster = Coaster.find(params[:id])
  erb :'/coasters/edit'
end

patch '/coasters/:id' do
  coaster = Coaster.find(params[:id])
  coaster.update({
    name: params[:name],
    speed: params[:speed],
    height_requirement: params[:height_requirement],
    image_url: params[:image_url]
    })
  redirect to('/coasters/' + coaster.id.to_s)
end

delete '/coasters/:id' do
  coaster = Coaster.find(params[:id])
  coaster.destroy
  redirect to('/coasters')
end

post '/coasters' do
  coaster = Coaster.create({
    name: params[:name],
    speed: params[:speed],
    height_requirement: params[:height_requirement],
    image_url: params[:image_url]
    })
  redirect to('/coasters/' + coaster.id.to_s)
end

