class HerosController < ApplicationController
  def index
    @index = Hero.all
  end

  def new
  end

  def create
  end

  def show
    @hero = Hero.find(params[:id])
  end

  def edit
    @hero = Hero.
  end

  def update
  end

  def destroy
  end
end
