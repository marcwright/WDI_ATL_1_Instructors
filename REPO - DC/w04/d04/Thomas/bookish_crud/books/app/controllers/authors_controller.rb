class AuthorsController < ApplicationController

  def index
    @authors = Author.all
    render :index
  end

  def show
    @author = Author.find(params[:id])
    render :show
  end

  def create
    Author.create(name: params[:name], birth: params[:birth], gender: params[:gender], has_pseudo: params[:has_pseudo])
    redirect_to '/authors'
  end

  def edit
    @author = Author.find(params[:id])
    render :edit
  end

  def update
    author = Author.find(params[:id])
    author.update(name: params[:name], birth: params[:birth], gender: params[:gender], has_pseudo: params[:has_pseudo])
    redirect_to("/authors/#{author.id}")
  end

  def destroy
    author = Author.find(params[:id])
    author.destroy
    redirect_to '/authors'
  end

end
