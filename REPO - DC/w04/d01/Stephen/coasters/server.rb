#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-12 15:43:56
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-12 16:45:23

# DROP TABLE IF EXISTS coasters;
# CREATE TABLE coasters(
#   id SERIAL PRIMARY KEY,
#   name VARCHAR(100) NOT NULL,
#   min_height INTEGER NOT NULL,
#   top_speed INTEGER NOT NULL,
#   image_url TEXT NOT NULL
# );

require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/coaster'

get '/' do
  erb :home
end

# display an index of all the roller coasters
get '/coasters' do
  @coasters = Coaster.all
  erb :'coasters/index'
end

# create a new roller coaster
get '/coasters/new' do
  erb :'coasters/new'
end

# create a new roller coaster based on specified information
post '/coasters' do
  c = Coaster.create({
    name: params[:name],
    min_height: params[:min_height],
    top_speed: params[:top_speed],
    image_url: params[:image_url]
})
  redirect to('/coasters/' + c.id.to_s)
end

# displays information for a single roller coaster
get '/coasters/:id' do
  @coaster = Coaster.find(params[:id])
  erb :'coasters/show'
end

# allows a user to edit a specified roller coaster
get '/coasters/:id/edit' do
  @coaster = Coaster.find(params[:id])
  erb :'coasters/edit'
end

# updates a specified roller coaster
patch '/coasters/:id' do
  c = Coaster.find(params[:id])
  c.update({
    name: params[:name],
    min_height: params[:min_height],
    top_speed: params[:top_speed],
    image_url: params[:image_url]
  })
  redirect to('/coasters/' + c.id.to_s)
end

# deletes a specified roller coaster
delete '/coasters/:id' do
  c = Coaster.find(params[:id])
  c.destroy
  redirect to('/coasters')
end
