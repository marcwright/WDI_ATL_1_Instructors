#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-12 15:43:56
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-12 19:27:27

# DROP TABLE IF EXISTS koopas;
# CREATE TABLE koopas(
#   id SERIAL PRIMARY KEY,
#   name VARCHAR(100) NOT NULL,
#   color VARCHAR(100) NOT NULL,
#   has_shell BOOLEAN DEFAULT TRUE,
#   image_url TEXT NOT NULL
# );

require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/koopa'

get '/' do
  redirect to '/koopas'
end

# display an index of all the koopas
get '/koopas' do
  @koopas = Koopa.all
  erb :'koopas/index'
end

# create a new koopa
get '/koopas/new' do
  erb :'koopas/new'
end

# create a new koopa based on specified information
post '/koopas' do
  k = Koopa.create({
    name: params[:name],
    color: params[:color],
    image_url: params[:image_url]
})
  redirect to('/koopas/' + k.id.to_s)
end

# displays information for a single koopa
get '/koopas/:id' do
  @koopa = Koopa.find(params[:id])
  erb :'koopas/show'
end

# allows a user to edit a specified koopa
get '/koopas/:id/edit' do
  @koopa = Koopa.find(params[:id])
  erb :'koopas/edit'
end

# updates a specified koopa
patch '/koopas/:id' do
  k = Koopa.find(params[:id])
  k.update({
    name: params[:name],
    color: params[:color],
    has_shell: !(params[:has_shell] == nil),
    image_url: params[:image_url]
  })
  redirect to('/koopas/' + k.id.to_s)
end

# deletes a specified koopa
delete '/koopas/:id' do
  k = Koopa.find(params[:id])
  k.destroy
  redirect to('/koopas')
end
