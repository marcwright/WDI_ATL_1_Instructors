class EntriesController < ApplicationController

  def index
    @entries = Entry.all
    render :index
  end

  def show
    @entry = Entry.find(params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    Entry.create(author: params[:author], photo_url: params[:photo_url], date_taken: params[:date_taken])
    redirect_to 'entries'
  end

  def edit
    @entry = Entry.find(params[:id])
    render :edit
  end

  def patch
    entry = Entries.find(params[:id])
    entry.update({
      author: params[:author],
      photo_url: params[:photo_url],
      date_taken: params[:date_taken]
      })
  end

  def delete
    Entry.find(params[:id]).destroy
  end

end
