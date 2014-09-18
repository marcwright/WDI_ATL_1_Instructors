require "sinatra"
require "sinatra/reloader"
require "pry"

guestbook = {
  1 => "Jack",
  2 => "Shelly",
  3 => "Danny"
}

get '/guestbook' do
  guestbook.values.join(', ')
end


get "/guestbook/:id" do
  id = params[:id].to_i
  guestbook[id]
end

post "/guestbook" do
  new_key = guestbook.keys.last + 1
  guestbook[new_key] = params[:id]
end



