# Stephen Stanwood (stephen@stanwoodsolutions.com)

require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/' do
  "<h1>hello stephen!</h1>" +
  "<h2><a href='/coffee'>COFFEE</a></h2>" +
  "<h2><a href='/lunch'>LUNCH</a></h2>" +
  "<h2><a href='/drunk'>DRUNK</a></h2>" +
  "<h1>WHAT YOUR NAME:</h1>" +
  "<form action="demo_form.asp">
  First name: <input type="text" name="fname"><br>
  Last name: <input type="text" name="lname"><br>
  <input type="submit" value="Submit">
</form>"
  "whoa content here"
end

get '/coffee' do
  "<h1 style=\"font-size: 96px\">coffee coffee coffee<br />it is so good!</h1>" +
  "<h1><a href='/'>home</a></h1>"
end

get '/lunch' do
  "<h1 style=\"font-size: 96px\">LONCH!</h1>" +
  "<h1><a href='/'>home</a></h1>"
end

get '/drunk' do
  "<h1 style=\"font-size: 96px\">sadness</h1>" +
  "<h1><a href='/'>home</a></h1>"
end

get '/greet/:name' do
  return "hey there, #{ params[:name] }"
end
