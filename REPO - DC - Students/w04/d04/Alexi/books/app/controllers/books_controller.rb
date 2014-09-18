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
      date: params[:date], 
      genre: params[:genre]
    )
    redirect_to "/authors/#{params[:author_id]}/#{params[:book_id]}"
  end

end # END OF CLASS
