class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def new

  end

  def create
    Author.create(author: params[:author],
      dob: params[:dob],
      gender: params[:gender],
      has_pseudonym: params[:has_pseudonym]
      )
    redirect_to '/authors'
  end

  def edit
    @author = Author.find(params[:id])
  end

  def show
    @author = Author.find(params[:id])
    render :author
  end

  def update
    @author = Author.find(params[:id])
    @author.update(author: params[:author],
      dob: params[:dob],
      gender: params[:gender],
      has_pseudonym: params[:has_pseudonym]
      )
    redirect_to '/authors'
  end

  def destroy
    author = Author.find(params[:id])
    author.destroy
    redirect_to '/authors'
  end

end
