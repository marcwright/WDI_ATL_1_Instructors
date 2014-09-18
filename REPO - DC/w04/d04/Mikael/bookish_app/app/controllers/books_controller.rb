class BooksController < ApplicationController

  def index
    @books = Author.find(params[:author_id]).books
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end

  def create
    Book.create(author_id: params[:author_id], title: params[:title], release_date: params[:release_date], genre: params[:genre])
    redirect_to("/authors/#{params[:author_id]}/books")
  end
end
