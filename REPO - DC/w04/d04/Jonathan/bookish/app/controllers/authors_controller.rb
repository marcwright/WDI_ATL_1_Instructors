class AuthorsController < ApplicationController

  def index
    @authors = Author.all
    render :index
  end

  def new
    render :new
  end

  def create
    Author.create(
      name: params[:name],
      dob: params[:dob],
      gender: params[:gender],
      has_pseudonym: params[:has_pseudonym]
      )
    redirect_to '/authors'
  end

  def show
    @author = Author.find(params[:id])
  end




# binding.pry




end

