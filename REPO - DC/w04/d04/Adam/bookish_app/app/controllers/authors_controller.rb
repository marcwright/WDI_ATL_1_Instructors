class AuthorsController < ApplicationController

  def index
    @authors = Author.all
    render :index
  end

  def create
    Author.create(name: params[:name], birth: params[:birth], gender: params[:gender], has_pseudonym: params[:has_pseudonym])
    redirect_to '/authors'
  end

  def show
    @author = Author.find(params[:id])
    render :show
  end

  def destroy
    Author.destroy(params[:id])
    redirect_to '/authors'
  end


end
