class HerosController < ApplicationController

  # before_action :find_hero, only: [:show, :edit, :update, :destroy]

  def index
    @heroes = Hero.all
  end

  def new
    @hero = Hero.new
  end

  def create
    @hero = Hero.create(hero_params)
    redirect_to @hero
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
  @hero = Hero.find(params[:id])
  @hero.destroy
  redirect_to heros_path
  end

  private

  # def find_hero
  #   @hero = Hero.find(params[:id])
  # end

#this is security stuff, listing out only the data types you will accept; nerds call it "white listed" or "sanitized"
#also called "strong params"

  def hero_params
    params.require(:hero).permit(:name, :secret_identity, :image_url)
  end
end
