class BooksController < ApplicationController

  def index
    @books = Book.where(author_id: params["author_id"])
    @author = Author.find(params[:author_id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @author_id = params[:author_id]
  end

  def create
    Book.create(title: params[:title], release_date: params[:release_date], genre: params[:genre], author_id: params[:author_id])
    redirect_to("/authors/#{params[:author_id]}/books")
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to("/authors/#{params[:author_id]}")
  end

end
