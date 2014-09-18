class ToysController < ApplicationController
  # this page should show all the dogs of a particular
  def index
    @toys = Toy.where(dog_id: params[:dog_id])
    render :index
  end

  def show
    @toy = Toy.find(params[:id])
    render :show
  end

  def new
    @toy = Toy.new
    render :new
  end

  def create
    @toy = Toy.create(name: params[:name], photo_url: params[:photo_url], dog_id: params[:dog_id])
    redirect_to("/dogs/#{params[:dog_id]}/toys/#{@toy.id}")
  end
end
