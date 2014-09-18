require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/koopa'




################## LIST ALL KOOPAS
get '/' do #lists all koopas, colors and shell y/n
  @koopas = Koopa.all
erb :'koopas/index'
end

################# CREATE A NEW KOOPA

get '/koopas/new' do #GETS the form to submit a new koopa
erb :'koopas/new'
end

post '/' do # POSTS the created koopa
Koopa.create({name: params[:name], color: params[:color],
  has_shell: params[:has_shell], image_url: params[:image_url]})
end


##############  SHOW A KOOPA by ID #

get '/koopas/:id' do #displays a single koopa, based on id #
  @koopa = Koopa.find(params[:id])
  erb :'koopas/show'
end

##########  EDIT A KOOPA

get '/koopas/:id/edit' do #gets the form to EDIT an existing koopa
@koopa = Koopa.find(params[:id])
erb :'koopas/edit' #the folder koopa, file name edit.erb
end

patch '/:id' do # submits the edited clown
koopa = Koopa.find(params[:id])
koopa.update({name: params[:name], color: params[:color],
  has_shell: params[:has_shell], image_url: params[:image_url]})
end

############## DESTROY

delete '/:id' do
  koopa = Koopa.find(params[:id])
  koopa.destroy
 redirect to('/')
end
