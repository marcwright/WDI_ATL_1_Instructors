class CharactersController < ApplicationController

  def index
    @characters = Starwar.all
    render :index
  end

  def new
    render :new
  end

  def create
    Starwar.create(name: params[:name], image_url: params[:image_url])
    redirect_to '/characters'
  end

  def show
    @character = Starwar.find(params[:id])
    render :show
  end

end
