class HerosController < ApplicationController

  def index
    @heros = Hero.all
  end

  def new

  end

  def create
  end

  def show
    @hero = Hero.find(params[:id])
  end

  def edit
    @hero = Hero.find(params[:id])
  end

  def update
    @hero = Hero.find(params[:id])
    @hero.update(hero_params)
    redirect_to @hero
  end

  def destroy
  end

  private

  def hero_params
    params.require(:hero).permit(:name, :secret_identity, :image_url)
  end

end
