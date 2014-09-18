#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-15 15:30:56
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-16 07:30:49

class BooksController < ApplicationController

  # Displays all of the books in the database
  def index
    @author = Author.find(params[:author_id])
    @books = @author.books
    render :index
  end

  # Creates a new book in the database
  def create
    Book.create(
      title: params[:title],
      release_date: params[:release_date],
      genre: params[:genre],
      author_id: params[:author_id])
    redirect_to "/authors/#{params[:author_id]}/books"
  end

  # Offers the user the chance to add a book
  def new
    @author = Author.find(params[:author_id])
    render :new
  end

  # Shows the details for a specific book
  def show
    @author = Author.find(params[:author_id])
    @book = Book.find(params[:id])
    render :show
  end

  # Destroys a given entry in the database
  def destroy
    Book.find(params[:id]).destroy
    redirect_to "/authors/#{params[:author_id]}/books"
  end

end
