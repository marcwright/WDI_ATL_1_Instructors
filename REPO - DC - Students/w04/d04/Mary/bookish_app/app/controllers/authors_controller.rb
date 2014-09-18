class AuthorsController < ApplicationController

  def index
    @authors = Author.all
    render :index
  end

  def show
    @author = Author.find(params[:id])
    @books = Book.where(author_id: @author.id)
    render :show
  end

  def new
    render :new
  end

  def create
    Author.create(name: params[:name], date_of_birth: params[:date_of_birth], gender: params[:gender], has_pseudonym: params[:has_pseudonym])
    redirect_to '/authors'
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to '/authors'
  end

end
