class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def new
  end

  def create
    Author.create(name: params[:name], dob: params[:dob], gender: params[:gender], has_pseudonym: params[:has_pseudonym], image_url: params[:image_url])
    redirect_to '/authors'
  end

  def show
    @author = Author.find(params[:id])
    @book = Book.where(author_id: params[:id])
  end

  def destroy
    Author.destroy(params[:id])
    redirect_to '/authors'
  end

end

