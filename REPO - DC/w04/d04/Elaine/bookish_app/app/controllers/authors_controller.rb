class AuthorsController < ApplicationController

  def index
    @authors = Author.all
    render :index
  end

  def new
    render :new
  end

  def create
    Author.create(name: params[:name], dob: params[:dob], gender: params[:gender], has_pseudonym: params[:has_pseudonym])
    redirect_to '/authors'
  end

  def show
    @author = Author.find(params[:id])
    @books = Book.where(author_id: params["author_id"])

    render :show
  end

  def edit
    @author = Author.find(params[:id])
    render :edit
  end

  def update
    @author = Author.find(params[:id])
    @author.update({
      name: params[:name],
      dob: params[:dob],
      gender: params[:gender],
      has_pseudonym: params[:has_pseudonym]
      })
    redirect_to ('/authors/' + @author.id.to_s)
  end

  def destroy
    Author.find(params[:id]).destroy
    redirect_to '/authors'
  end


end
