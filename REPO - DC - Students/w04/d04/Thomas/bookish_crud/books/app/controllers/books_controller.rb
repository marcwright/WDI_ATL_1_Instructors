class BooksController < ApplicationController

  def index
    @books = Author.find(params[:author_id]).books
    @author = Author.find(params[:author_id])
  end

  def new
    @author = Author.find(params[:author_id])
    render :new
  end

  def create
    @author = Author.find(params[:author_id])
    @author.books.create(
      title: params[:title],
      release_date: params[:release_date],
      genre: params[:genre]
      )

    redirect_to "/authors/#{params[:author_id]}/books"
  end

  def destroy
  end

end
