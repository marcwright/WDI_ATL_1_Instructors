#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-09 16:31:57
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-09 16:58:57

require 'sinatra'
require 'sinatra/reloader'

COMPLIMENTS = [
  "Your instructors love you",
  "High five = ^5",
  "Is it Ruby Tuesday yet?",
  "It's almost beer o'clock",
  "The Force is strong with you"
]

COLORS = ["#FFBF00", "#0080FF","#01DF3A","#FF0080"]

get '/' do
  erb :compliment
end

get '/:name' do
  @name = params[:name].capitalize
  erb(:compliment)
end

post '/' do
  COMPLIMENTS.push(params[:compliment])
end
