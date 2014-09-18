#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-12 11:48:19
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-12 12:18:23

require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :form
end

get '/ponies' do
end

get '/flight' do
end

get '/pizza' do
end

get '/login' do
end
