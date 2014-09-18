class PhotosController < ApplicationController

  def index
    @photos = Photo.all
    render :index
  end

  def new
    @photos = Photo.all
    render :new
  end

  def create
    @photos = Photo.all
    Photo.create(author: params[:author], image_url: params[:image_url], date_taken: params[:date_taken])
    redirect_to '/'
  end

  def author
    @photos = Photo.all
    @photo = Photo.find(params[:id])
    render :author
  end

  def edit
    @photos = Photo.all
    @photo = Photo.find(params[:id])
    render :edit
  end

  def update
    @photos = Photo.all
    @photo = Photo.find(params[:id])
    @photo.update(author: params[:author], image_url: params[:image_url], date_taken: params[:date_taken])
    redirect_to '/'
  end

  def delete
    @photos = Photo.all
    photo = Photo.find(params[:id])
    photo.destroy
    redirect_to '/'
  end

end
