class CharactersController < ApplicationController

  def index
    redirect_to "/books"
  end

  def new
    @books = Book.all
  end

   def create
    Character.create(name: params[:name], gender: params[:gender], quirk: params[:quirk], book_id: params[:book_id])
    redirect_to "/books/#{params[:book_id]}/characters"
  end

  def show
    @characters = Character.find(params[:id])
    @book = Book.find(params[:book_id])
  end

  def destroy
    Character.destroy(params[:id])
    redirect_to '/books'
  end
end
