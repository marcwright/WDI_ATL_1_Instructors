require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/koopa'

get '/' do
  erb :home
end

# Display all Koopas
get '/koopas' do
  @koopa = Koopa.all
  erb :'koopas/index'
end

# Display new Koopa form
get '/koopas/new' do
  erb :'koopas/new'
end

post '/koopas' do
  koopa = Koopa.create({ # active record class was pluran instead of singular
    name: params[:name],
    color: params[:color],
    has_shell: (params[:has_shell] || false),
    image_url: params[:image_url]
  })
  redirect to('/koopas/' + koopa.id.to_s)
end

# get '/edit/:id/edit' do
#   @koopa = Koopa.find(params[:id])
#   erb :'koopas/edit'
# end
