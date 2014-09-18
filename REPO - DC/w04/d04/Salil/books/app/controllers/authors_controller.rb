class AuthorsController < ApplicationController

  def index
    @authors  = Author.all
    render :index
  end

  def new
    render :new
  end

  def create
    Author.create(name: params[:name], birthday: params[:birthday], gender: params[:gender],  has_pseudo: (params[:has_pseudo] || false))
    redirect_to '/authors'
  end

  def show
    @author = Author.find(params[:id])
    render :show
  end

  def edit
    @author = Author.find(params[:id])
    render :edit
  end

  def update
    author = Author.find(params[:id])
    author.update(name: params[:name], birthday: params[:birthday], gender: params[:gender],  has_pseudo: (params[:has_pseudo] || false))
    redirect_to "/authors/#{author.id}"
  end

  def destroy
    author = Author.find(params[:id])
    author.destroy
    redirect_to '/authors'
  end

end
