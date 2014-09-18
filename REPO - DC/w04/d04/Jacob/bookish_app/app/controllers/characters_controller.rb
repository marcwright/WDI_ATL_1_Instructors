class CharactersController < ApplicationController
  def index
    @book = Book.find(params[:book_id])
    @characters = Character.where(book_id: params["book_id"])
  end

  def show
    @character = Character.find(params[:id])
    @book = @character.book
  end

  def new
    @book_id = params[:book_id]
  end

  def create
    Character.create(name: params[:name], gender: params[:gender], quirk: params[:quirk], book_id: params[:book_id])
    redirect_to("/books/#{params[:book_id]}/characters")
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to("/books/#{params[:book_id]}")
  end

end
