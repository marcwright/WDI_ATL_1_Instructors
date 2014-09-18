require "pry"
require "active_record"
require "sinatra"
require "sinatra/reloader"

require_relative './models/config'
require_relative './models/koopa'



get '/' do
  erb :home
end

#Index Action
#Read all of the koopas
get '/koopas' do
  @koopas = Koopa.all
  erb :'koopas/index'
end
