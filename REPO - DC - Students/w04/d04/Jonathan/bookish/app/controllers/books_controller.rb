class BooksController < ApplicationController

  def index
    @books = Book.all
    @author = Author.find(params[:author_id])
    render :index
  end

  def show
    @book = Book.find(params[:id])
  end

end
