class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @characters = Character.where(book_id: @book.id)
  end

  def new
    @author_id = params[:author_id]
  end

  def create
    Book.create(
      title: params[:title],
      release_date: params[:release_date],
      genre: params[:genre],
      author_id: params[:author_id]
    )
    redirect_to("/authors/#{params[:author_id]}")
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to("/books")
  end

end
