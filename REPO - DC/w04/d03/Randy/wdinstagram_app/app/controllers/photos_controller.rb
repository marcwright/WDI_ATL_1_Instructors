class PhotosController < ApplicationController

  def index
    @photos = Entry.all
    render :index
  end

  def new
    render :new
  end

  def create
    Entry.create(author: params[:author], photo_url: params[:photo_url], date_taken: params[:date_taken])
    redirect_to('/photos')
  end

  def show
    @pic = Entry.find(params[:id])
    render :show
  end

  def edit
    @pic = Entry.find(params[:id])
    render :edit
  end

  def update
    pic = Entry.find(params[:id])
    pic.update(author: params[:author], photo_url: params[:photo_url], date_taken: params[:date_taken])
    redirect_to('/photos/' + pic.id.to_s)
  end

  def delete
   pic = Entry.find(params[:id])
   pic.destroy
    redirect_to('/photos')
  end

end
