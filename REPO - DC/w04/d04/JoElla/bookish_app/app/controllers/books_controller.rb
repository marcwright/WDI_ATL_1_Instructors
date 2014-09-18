class BooksController < ApplicationController

    def index
      @books = Author.find(params[:author_id]).books
    end

    def show
      @book = Author.find(params[:author_id]).books.find(params[:id])
    end


    def new

    end

  def create
    Book.create(
      title: params[:title],
      release_date: params[:release_date],
      genre: params[:genre],
      author_id: params[:author_id]
      )
      redirect_to('/authors/#{params([:author_id])}/books')
  end


end
