require 'sinatra'
require 'sinatra/reloader'
require 'pry'

past_calcs = {
  1 => "2+2=4",
  2 => "9+1=10"
}


get '/' do #a welcome message
  "<h1><center>Welcome to the calculator!</center></h1>" + "<br>" +
  "<center><img src='http://image.spreadshirt.com/image-server/image/composition/16545681/view/1/producttypecolor/70/type/png/width/280/height/280/80085-boobs-ringer-t_design.png'></center>"
end

get '/calculator' do #shows all past calculations
  past_calcs.values.join(", ")
end

get '/calculator/:id' do #look up any past cal. by its hash key
  whichcalc = params[:id].to_i
  return past_calcs[whichcalc]
  return "NOT FOUND"
end


post '/calculator/add' do
  num1 = params[:num1].to_i
  num2 = params[:num2].to_i
  newkey = past_calcs.keys.last + 1
  past_calcs[newkey] =  "#{num1}+#{num2}=#{num1+num2}"
  "#{num1}+#{num2}=#{num1+num2}"
end

post '/calculator/subtract' do
  num1 = params[:num1].to_i
  num2 = params[:num2].to_i
  newkey = past_calcs.keys.last + 1
  past_calcs[newkey] =  "#{num1}-#{num2}=#{num1-num2}"
  "#{num1}-#{num2}=#{num1-num2}"
end

post '/calculator/divide' do
  num1 = params[:num1].to_f
  num2 = params[:num2].to_f
  newkey = past_calcs.keys.last + 1
  past_calcs[newkey] =  "#{num1}/#{num2}=#{num1/num2}"
  "#{num1}/#{num2}=#{num1/num2}"
end

post '/calculator/multiply' do
  num1 = params[:num1].to_i
  num2 = params[:num2].to_i
  newkey = past_calcs.keys.last + 1
  past_calcs[newkey] =  "#{num1}x#{num2}=#{num1*num2}"
  "#{num1}x#{num2}=#{num1*num2}"
end
