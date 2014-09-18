class CharactersController < ApplicationController

  def index
    @characters = Character.all
    render :index
  end

  def show
    @characters = Character.find(params[:id])
    render :show
  end

  def create
    Character.create(name: params[:name], gender: params[:gender], quirk: params[:quirk])
    redirect_to '/characters'
  end



end
