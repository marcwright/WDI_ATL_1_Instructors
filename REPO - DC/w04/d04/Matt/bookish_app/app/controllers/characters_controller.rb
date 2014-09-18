class CharactersController < ApplicationController
  def index
    @book_id = params[:book_id]
    @characters = Character.where(book_id: params["book_id"])
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @book_id = params[:book_id]
  end

  def create
    book_id = params[:book_id]
    Character.create(name: params[:name],
      book_id: params[:book_id],
      gender: params[:gender],
      quirk: params[:quirk]
      )
    redirect_to "/books/#{book_id}/characters"
  end
end
