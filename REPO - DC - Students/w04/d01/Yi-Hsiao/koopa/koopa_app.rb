require "sinatra"
require "slim"
require "pry"
require_relative "models/koopa"

class KoopaApp < Sinatra::Base
  enable :method_override

  get "/" do
    @koopas = Koopa.all
    slim :"koopas/index"
  end

  get "/koopas/new" do
    slim :"koopas/create"
  end

  get "/koopas/:id" do |id|
    @koopa = Koopa.find(id)
    slim :"koopas/show"
  end

  get "/koopas/:id/edit" do |id|
    @koopa = Koopa.find(id)
    slim :"koopas/edit"
  end

  patch "/koopas/:id" do |id|
    koopa = Koopa.find(id)
    success = koopa.update(
      :name      => params[:name],
      :color     => params[:color],
      :has_shell => params[:has_shell] || false,
      :photo_url => params[:photo_url]
    )
    redirect "/koopas/#{ koopa.id }"
  end

  post "/koopas" do
    koopa = Koopa.create(
      :name      => params[:name],
      :color     => params[:color],
      :has_shell => true,
      :photo_url => params[:photo_url]
    )
    redirect "/koopas/#{ koopa.id }"
  end

end
