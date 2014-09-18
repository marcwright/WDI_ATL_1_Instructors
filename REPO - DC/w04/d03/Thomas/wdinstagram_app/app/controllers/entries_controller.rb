class EntriesController < ApplicationController

  def index
    @entries = Entry.all
    render :index
  end

  def new
    render :new
  end

  def create
    Entry.create(author: params[:author], photo_url: params[:photo_url], date_taken: params[:date_taken])
    redirect_to '/entries'
  end

  def show
    @entry = Entry.find(params[:id])
    render :show
  end

  def edit
    @entry = Entry.find(params[:id])
    render :edit
  end

  def update
    entry = Entry.find(params[:id])
    entry.update(author: params[:author], photo_url: params[:photo_url], date_taken: params[:date_taken])
    redirect_to("/entries/#{entry.id}")
  end

  def delete
    entry = Entry.find(params[:id])
    entry.destroy
    redirect_to '/entries'
  end

end

