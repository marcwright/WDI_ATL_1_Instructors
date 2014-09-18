require 'sinatra'
require 'sinatra/reloader'

#verb ie. 'Get' then 'relative path' root will always be '/'
#Next part is a do & end
    #This acts as a Method call where we pass an argument then pass a block (do/end)
     get '/' do
      "<style> h1 {color:red;}</style>
    <h1> Hello World! </h1>"
  end

  get '/coffee' do
    "<h1> HELLLOOOOOOOOO WOOORRLLDD! </h1>"
  end

get '/lunch' do
   "<h1> Bon Appetit World! </h1>"
  end

  get '/drunk' do
    "<h1> WOoO0oO)O0O0O)o0o)o </h1>"
  end

  get '/greet/:name/:fav_food' do
    if params[:name] == "mary"
    "<h1> Hello #{params[:name]} happy birthday here is some #{params[:fav_food]} </h1>"
    else
      "<h1> Hello #{params[:name]} it ain't yo birfday, no #{params[:fav_food]} for you!</h1>"
    end
  end

