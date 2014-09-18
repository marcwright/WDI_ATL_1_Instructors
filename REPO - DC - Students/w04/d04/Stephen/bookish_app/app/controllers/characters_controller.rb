#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-15 15:31:23
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-16 08:12:14

class CharactersController < ApplicationController

  # Displays all of the characters in the database
  def index
    @book = Book.find(params[:book_id])
    @author = @book.author
    @characters = @book.characters
    render :index
  end

  # Creates a new character in the database
  def create
    Character.create(
      name: params[:name],
      gender: params[:gender],
      quirk: params[:quirk],
      book_id: params[:book_id])
    redirect_to "/books/#{params[:book_id]}/characters"
  end

  # Offers the user the chance to add a character
  def new
    @book = Book.find(params[:book_id])
    render :new
  end

  # Shows the details for a specific character
  def show
    @character = Character.find(params[:id])
    @book = @character.book
    render :show
  end

  # Destroys a given character in the database
  def destroy
    Character.find(params[:id]).destroy
    redirect_to "/books/#{params[:book_id]}/characters"
  end

end
