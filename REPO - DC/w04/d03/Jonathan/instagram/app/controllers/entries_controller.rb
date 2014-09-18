class EntriesController < ApplicationController

  def index
    @entries = Entry.all
    render :index
  end

  def new
    render :new
  end

  def create
    Entry.create(
      author: params[:author],
      photo_url: params[:photo_url],
      date_taken: params[:date_taken]
      )
    redirect_to '/'
  end

  def update
    Entry.update(
      author: params[:author],
      photo_url: params[:photo_url],
      date_taken: params[:date_taken]
      )
    redirect_to '/'
  end

  def edit
    @entry = Entry.find(params[:id])
    render :edit
  end


end

