#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-09 14:24:54
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-09 15:38:25

require 'sinatra'
require 'sinatra/reloader'

get '/' do
  # erb takes a filename, returns a string
  erb :index
end

get '/verse/:bottles' do
  @bottles = params[:bottles].to_i
  @plural = (@bottles != 1)
  erb :verse
end

get '/refrain/:bottles' do
  @bottles = params[:bottles].to_i
  @plural = (@bottles != 1)
  @next = @bottles - 1
  erb :refrain
end
