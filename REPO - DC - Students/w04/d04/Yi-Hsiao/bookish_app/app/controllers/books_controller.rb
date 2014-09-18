class BooksController < ApplicationController
  before_action :find_author, only: [:new, :create]

  def new
    @book = @author.books.new
  end

  def create
    @book = @author.books.new book_params

    if @book.save
      redirect_to @book
    else
      render "new"
    end
  end

  def show
    @book = Book.find params[:id]
    @characters = @book.characters
  end

  private
  def find_author
    @author = Author.find params[:author_id]
  end

  def book_params
    params.require(:book).permit(:title, :release_date, :genre)
  end
end
