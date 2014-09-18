#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-16 10:11:56
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-16 11:02:10

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

  # Security measure that builds white-listed params object to send over
  def hero_params
    params.require(:hero).permit(:name, :secret_identity, :image_url)
  end
end
