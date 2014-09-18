require 'sinatra'
require 'sinatra/reloader' if development?
require 'json'

chatlines = []

get '/' do
  @username = params["username"] || ""
  if chatlines.length > 10
    @lines = chatlines[-10, 10]
  else
    @lines = chatlines
  end
  erb :index
end

post '/chat' do
  # Add a line to our chat
  requirements = %w{username message}
  if requirements.all? { |x| params.has_key? x }
    chatlines << {:username => params["username"], :timestamp => Time.now().to_i, :message => params["message"]}
    if request.xhr? and params.has_key? "since"
      return [200, {"Content-Type" => "application/json"}, JSON.generate(chatlines.select { |x| x[:timestamp] > params["since"].to_i })]
    end
  end
  redirect to '/?username=' + params["username"]
end




