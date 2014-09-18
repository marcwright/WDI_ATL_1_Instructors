class BooksController < ApplicationController

  def index
    if params[:author_id]
      @author = Author.find(params[:author_id])
      @books = @author.books
    else
      @books = Book.all
    end
  end

  def show
    if params[:author_id]
      @book = Book.find(params[:id])
    else
      @book = Book.find(params[:id])
    end

  end

  def new

    @author_id = params[:author_id]
    @author = Author.find(params[:author_id])

  end

  def create
    if params[:author_id]
      Book.create(title: params[:title], release_date: params[:release_date], genre: params[:genre], author_id: params[:author_id])
      redirect_to ("/authors/#{params[:author_id]}/books")
    else
      Book.create(title: params[:title], release_date: params[:release_date], genre: params[:genre])
      redirect_to '/books'
    end

  end

  def destroy
    if params[:author_id]
      Book.find(params[:id]).destroy
      redirect_to ("/authors/#{params[:author_id]}/books")
    end
  end

end
