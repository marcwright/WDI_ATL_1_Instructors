##############################################
#!/usr/bin/ruby
# @Author: Richard Hessler
# @Date:   2014-06-10 11:23:47
# @Last Modified by:   Richard Hessler
# @Last Modified time: 2014-06-10 15:38:49
##############################################

class CharactersController < ApplicationController

  def index
    @characters = Character.order("created_at ASC")
  end

  def update
    @character = Character.find(params[:id])
    if @character.update(characters_params)
      render status: 200, nothing: true
    else
      render status: 400, nothing: true
    end
  end

  def create
    @character = Character.new(characters_params)
    if @character.save
      render json: @character
    else
      render status: 400, nothing: true
    end
  end

  def destroy
    @character = Character.find(params[:id])
    if @character.destroy
      render json: { } # sends back an empty object to receive call back function
    else
      render status: 400, nothing: true
    end
  end

  private

  def characters_params
    params.require(:character).permit(:name, :is_dead)
  end

end
