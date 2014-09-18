class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def new
    @book_id = params[:book_id]
    render :new
  end

  def show
    @character = Character.find(params[:id])
  end

  def create
    Character.create(
      name: params[:name],
      gender: params[:gender],
      quirk: params[:quirk],
      book_id: params[:book_id]
    )
    redirect_to("/characters")
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to("/characters")
  end

end
