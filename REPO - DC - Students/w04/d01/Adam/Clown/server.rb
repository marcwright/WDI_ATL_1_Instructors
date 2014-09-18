require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/clown'

# Clown.create (name: "Adam", talent: "singing", is_creepy: "1", img_url: "google.com")

get '/' do
  erb :'clowns/index'
end

# Index Action
# Read all of the clowns
get '/clowns' do
  @clowns = Clown.all
  erb :'clowns/index'
end

#  "psql -d clown_db -f schema.sql"
