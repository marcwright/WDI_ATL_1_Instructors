class CharactersController < ApplicationController

  def index
    @characters = Character.where(book_id: params["book_id"])
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @book_id = params[:book_id]
  end

  def create
    Character.create(name: params[:name], book_id: params[:book_id], gender: params[:gender], quirk: params[:quirk])
    redirect_to '/books/#{author.id}/characters'
  end

  def destroy
    Character.find(params[:id]).destroy
    redirect_to '/books/#{params[book_id]}/characters'
  end

end
