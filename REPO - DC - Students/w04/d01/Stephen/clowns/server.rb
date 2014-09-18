#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-12 13:48:32
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-12 14:47:41

require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative "./models/config"
require_relative "./models/clown"

# Clown.create(name: "Stephen", talent: "jokes", is_creepy: false, image_url: "http://goo.gl/vUg1DE")
# Clown.create(name: "Frank", talent: "swimming", is_creepy: false, image_url: "http://goo.gl/Ae9afa")
# Clown.create(name: "Megan", talent: "laughing", is_creepy: false, image_url: "http://goo.gl/ddg1m1")

get '/' do
  erb :home
end

get '/clowns' do
  @clowns = Clown.all
  erb :'clowns/index'
end

post '/clowns' do

end

get '/clowns/new' do
  erb :'clowns/new'
end
