#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-15 15:30:56
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-16 08:00:26

class AuthorsController < ApplicationController

  # Displays all of the authors in the database
  def index
    @authors = Author.all
    render :index
  end

  # Creates a new author in the database
  def create
    Author.create(
      name: params[:name],
      dob: params[:dob],
      gender: params[:gender],
      has_pseudonym: params[:has_pseudonym])
    redirect_to '/authors'
  end

  # Offers the user the chance to add an author
  def new
    @book = params[:book_id]
    render :new
  end

  # Shows the details for a specific author
  def show
    @author = Author.find(params[:id])
    render :show
  end

  # Destroys a given author in the database
  def destroy
    Author.destroy(params[:id])
    redirect_to '/authors'
  end

end
