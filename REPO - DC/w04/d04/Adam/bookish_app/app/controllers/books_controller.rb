class BooksController < ApplicationController

  def index
    @books = Book.all
    render :index
  end

  def create
    Book.create(title: params[:title], release_date: params[:release_date], genre: params[:genre])
    redirect_to '/books'
  end

  def show
    @books = Book.find(params[:id])
    render :show
  end

end

