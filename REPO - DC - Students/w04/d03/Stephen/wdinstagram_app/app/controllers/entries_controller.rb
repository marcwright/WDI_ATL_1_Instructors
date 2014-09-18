#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-14 19:19:38
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-14 20:09:46

class EntriesController < ApplicationController

  # Displays all of the entries in the database
  def index
    @entries = Entry.all.reverse
    render :index
  end

  # Offers the user the chance to add an entry
  def new
    render :new
  end

  # Creates a new entry in the database
  def save
    Entry.create(
      author: params[:author],
      photo_url: params[:photo_url],
      date_taken: Date.today,
      caption: params[:caption])
    redirect_to '/entries'
  end

  # Shows the details for a specific entry
  def show
    @entry = Entry.find(params[:id])
    render :show
  end

  # Allows the user to edit a given entry
  def edit
    @entry = Entry.find(params[:id])
    render :edit
  end

  # Updates the information on a specific entry in the databse
  def update
    Entry.find(params[:id]).update(
      author: params[:author],
      photo_url: params[:photo_url],
      date_taken: Date.today,
      caption: params[:caption])
    redirect_to 'entries/#{params[:id]}'
  end

  # Destroys a given entry in the database
  def delete
    Entry.find(params[:id]).destroy
    redirect_to '/entries'
  end

end
