class ThinkersController < ApplicationController

  def index
    @thinkers = Thinker.all
    render :index
  end

  def new
    render :new
  end

  def create
    Thinker.create(name: params[:name],
      quote: params[:quote],
      image_url: params[:image_url]
      )
    redirect_to '/thinkers'
  end

  def show
    @thinker = Thinker.find(params[:id])
    render :show
  end

  def destroy
    thinker = Thinker.find(params[:id])
    thinker.destroy
    redirect_to '/thinkers'
  end


end
