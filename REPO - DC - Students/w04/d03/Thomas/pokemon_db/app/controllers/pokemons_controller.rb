class PokemonsController < ApplicationController

  def index
    @pokemons = Pokemon.all
    render :index
  end

  def new
    render :new
  end

  def create
    Pokemon.create(name: params[:name], image_url: params[:image_url], attack: params[:attack])
    redirect_to '/'
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    render :show
  end

end
