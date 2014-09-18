class BooksController < ApplicationController

  def index
    @author_id = params[:author_id]
    @books = Book.where(author_id: params["author_id"])
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @author_id = params[:author_id]
  end

  def create
    Book.create(title: params[:title],
      author_id: params[:author_id],
      release_date: params[:release_date],
      genre: params[:genre]
      )
    redirect_to "/authors/#{params[:author_id]}/books"
  end

end
