class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to @author
    else
      render "new"
    end
  end

  def show
    @author = Author.find(params[:id])
    @books = @author.books
  end

  private
  def author_params
    params.require(:author).permit(:name, :dob, :gender, :has_pseudonym)
  end
end
