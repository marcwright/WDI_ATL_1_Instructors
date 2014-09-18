class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @authors = Author.all
  end

  def create
    Book.create(title: params[:title], release_date: params[:release_date], genre: params[:genre], author_id: params[:author_id])
    redirect_to "/authors/#{params[:author_id]}/books"
  end

  def show
    @book = Book.find(params[:id])
    @character = Character.where(book_id: params[:id])
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to '/books'
  end
end
