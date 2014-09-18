class BooksController < ApplicationController

def index
    @books = Book.where(author_id: params["author_id"])

  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book_id = params[:book_id]
  end

  def create
   Book.create(
      name: params[:name],
      gender: params[:gender],
      quirk: params[:quirk]
    )
    redirect_to("/authors/#{params[:author_id]}/books")
  end
end
