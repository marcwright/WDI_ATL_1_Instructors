require 'sinatra'

get '/testing/:id' do
  result =  "User entered id: " + params[:id]
  return result
end

get '/' do
  'Hello World'
end

get '/provides', provides: 'json' do
  '{result: "JSON in here"}'
end

get '/provides' do
  '<h1>HTML response</h1>'
end
