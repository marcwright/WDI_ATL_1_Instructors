class EntriesController < ApplicationController

  def index
    render :index
  end

  def list
    @entries = Entry.all
    render :list
  end

  def new
    render :new
  end

  def create
    Entry.create(author: params[:author], date_taken: Time.now, photo_url: params[:photo_url], caption: params[:caption])
    redirect_to '/entries'
  end

  def show
    @entries = Entry.find(params[:id])
    render :show
  end

  def edit
    @entries = Entry.find(params[:id])
    render :edit
  end

  def update
    @entries = Entry.find(params[:id])
    @entries.update(author: params[:author], date_taken: Time.now, photo_url: params[:photo_url], caption: params[:caption])
    redirect_to '/entries'
  end

  def delete
    Entry.destroy(params[:id])
    redirect_to '/entries'
  end

end
