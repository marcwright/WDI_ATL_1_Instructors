require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './models/config'
require_relative './models/ar_koopas'

# Koopa.create(name: "Koopa Troopa", color: "yellow", has_shell: true, image_url: "http://upload.wikimedia.org/wikipedia/en/7/75/Koopa_Troopa_3D_Land.png")

# get '/' do
#   erb :home
# end

# List all koopas
get '/' do
  @koopa = Koopa.all
  erb :index
end

# New Koopa
get '/new' do
  erb :new
end

# Create Koopa
post '/' do
  koopa = Koopa.create({
    name: params[:name],
    color: params[:color],
    has_shell: (params[:has_shell] || true),
    image_url: params[:image_url]
  })
  redirect to ('/' + koopa.id.to_s)
end

# Show Koopa
get '/:id' do
  @koopa = Koopa.find(params[:id])
  erb :show
end

# Edit Koopa
get ':id/edit' do
  @koopa = Koopa.find(params[:id])
  erb :edit
end

# Update Koopa
post '/:id' do
  koopa = Koopa.find(params[:id])
  koopa.update({
    name: params[:name],
    color: params[:color],
    has_shell: (params[:has_shell] || true),
    image_url: params[:image_url]
  })
  redirect to ('/' + koopa.id.to_s)
end
# Destroy Koopa
delete '/:id' do
  koopa = Koopa.find(params[:id])
  koopa.destroy
  redirect to('/')
end
