class HerosController < ApplicationController
before_action :find_hero, only: [:show, :edit, :update, :destroy]

  def index
    @heros = Hero.all
  end

  def new
    # necessary so instance variable in partial will work with new & edit
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
    #used raise to see what new info is now in hash assigned to hero key; have to "white-list" data that you want to integrate, so can't just use update method for that param; otherwise people can do malicious things like making themselves an admin => PRIVATE
    @hero.update(hero_params)
    redirect_to @hero
  end

  def destroy
    @hero.destroy
    redirect_to heros_path
  end

  private
  # do this when repeating yourself and use before up top to be DRY
  def find_hero
    @hero = Hero.find(params[:id])
  end

  def hero_params
    params.require(:hero).permit(:name, :secret_identity, :image_url)
  end
end
