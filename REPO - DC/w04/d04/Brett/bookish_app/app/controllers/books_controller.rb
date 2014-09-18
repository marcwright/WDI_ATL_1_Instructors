class BooksController < ApplicationController
  def index
    @books = Book.where(author_id: params["author_id"])
  end

  def new
    @author_id = params[:author_id]
  end

  def create
    Book.create(title: params[:title], author_id: params[:author_id], genre: params[:genre], release_date: params[:release_date])
    redirect_to '/authors/#{params[:author_id]}/books'
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to '/authors/#{params[:author_id]}/books'
  end
end
