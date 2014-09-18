class HerosController < ApplicationController
  before_action :find_hero, only: [:show, :edit, :update:, :destroy]

  def index
    @hero = Hero.all
  end

  def new
    # dummy hero - place holder for new form
    @hero = Hero.new
  end

  def create
    @hero=Hero.create(hero_params)
    redirect_to @hero
  end

  def show
    #  before_action grabs this: @hero = Hero.find(params[:id])
  end

  def edit
     #  before_action grabs this: @hero = Hero.find(params[:id])
  end

  def update
    #  before_action grabs this: @hero = Hero.find(params[:id])
    @hero.update(hero_params)
    redirect_to @hero
  end

  def destroy
    #  before_action grabs this: @hero = Hero.find(params[:id])
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
