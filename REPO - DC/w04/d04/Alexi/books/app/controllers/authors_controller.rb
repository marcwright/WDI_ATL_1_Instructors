class AuthorsController < ApplicationController
  def index
    @authors = Author.all
    @books = Book.all
    render :index
  end

  def new
    render :new
  end

  def create
    Author.create(
      name: params[:name], 
      birth: params[:birth], 
      gender: params[:gender], 
      has_pseudo: params[:has_pseudo] || false
    )
    redirect_to '/'
  end

  def show
    @author = Author.find(params[:id])
    render :show
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
     @author.update(
      name: params[:name], 
      birth: params[:birth], 
      gender: params[:gender], 
      has_pseudo: params[:has_pseudo]
    )
    redirect_to "/authors/#{@author_id}"
  end

  def destroy
    author = Author.find(params[:id])
    author.destroy
    redirect_to '/'
  end

end # END OF CLASS
