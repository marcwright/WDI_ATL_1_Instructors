class HerosController < ApplicationController
  before_action :find_hero, only: [:show, :edit, :update, :destroy]

  def index
    @heros = Hero.all
  end

  def new
    @hero = Hero.new
  end

  def create
    @hero = Hero.create(hero_params)
    redirect_to @hero
  end

  def show
  end

  def edit
  end

  def update
    @hero.update(hero_params)
    redirect_to @hero
  end

  def destroy
    @hero.destroy
    redirect_to heros_path
  end

  private

  def find_hero
    @hero = Hero.find(params[:id])
  end


  def hero_params
    params.require(:hero).permit(:name, :secret_identity, :image_url)
  end

end
