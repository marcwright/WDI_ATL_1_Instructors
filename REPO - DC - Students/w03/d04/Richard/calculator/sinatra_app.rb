require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/'  do
  "Herro world!"
  "<h1>Herro Inhakka Lakka</h1>"

  end

get '/greeting/:name/:fav_food' do
  if params[:name] == "mary"
    "Hey #{params[:name]  }, Heard it's your birthday.  Want some #{params[:fav_food]}?"
  else
    "What up, #{params[:name]}, let\'s get some #{params[:fav_food]}"
  end
end


# get '/lunch/:noms' do
#   "<h3>Lunch all the time</h3>"
# end

# get '/drunk' do
#   "<h4>Drunk all the ti-eye-yme</h4>"
# end
