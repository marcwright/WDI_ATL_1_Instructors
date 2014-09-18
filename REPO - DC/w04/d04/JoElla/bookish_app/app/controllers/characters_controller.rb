class CharactersController < ApplicationController

  def index
    @character = Book.find(params[:book_id]).characters
  end

  def show
    @character = Book.find(params[:book_id]).characters.find(params[:id])

  end

  def new

  end

  def create
    Character.create(
      name: params[:name],
      gender: params[:gender],
      quirk: params[:quirk],
      book_id: params[:book_id]
      )
    redirect_to("/books/#{params[:book_id]}/characters")
  end



end
