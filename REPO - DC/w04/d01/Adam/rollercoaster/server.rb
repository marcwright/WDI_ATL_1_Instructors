require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/rollercoaster'

# Rollercoaster.create (name: "Adam", top_speed: "87", img_url: "google.com")

get '/' do
  binding.pry
  erb :'rollercoaster/index'
end



#  "psql -d rollercoaster_db -f schema.sql"
