class CharactersController < ApplicationController

  def index
    @characters = Character.order("created_at ASC")
  end

  def update
    @character = Character.find(params[:id])
    if @character.update(character_params)
      render status: 200, nothing: true
    else
      render status: 400, nothing: true
    end
  end

  def create
    @character = Character.new(character_params)
      if @character.save
        render json: @character
      else
        render status: 400, nothing: true
      end
  end

private

  def character_params
    params.require(:character).permit(:name, :dead)
  end


end
