class CartoonsController < ApplicationController
  def index
    @cartoons = Cartoon.all
    render :index
  end

  def new
    render :new
  end

  def create
    Cartoon.create(name: params[:name], location: params[:location], image_url: params[:image_url])
    redirect_to '/cartoons'
  end

  def show
    @cartoon = Cartoon.find(params[:id])
    render:show
  end

  def edit
    @cartoon = Cartoon.find(params[:id])
    render :edit
  end

  def update
    cartoon = Cartoon.find(params[:id])
    cartoon.update(name: params[:name], location: params[:location], image_url: params[:image_url])
    redirect_to('/cartoons/' + cartoon.id.to_s)
  end

  def delete
    @cartoon = Cartoon.find(params[:id])
    @cartoon.destroy
    redirect_to('/cartoons')
  end
end
