class ToysController < ApplicationController

  def index
    @toys = Toy.where(dog_id: params["dog_id"])
  end

  def show
    @toys = Toy.find(params[:id])
  end

  def new
    binding.pry
    @dog_id = params[:dog_id]
  end

  def create
    Toy.create(name: params[:name], photo_url: params[:photo_url], dog_id: params[:dog_id])
    redirect_to("/dogs/#{params[:dog_id]}/toys")
  end
end
