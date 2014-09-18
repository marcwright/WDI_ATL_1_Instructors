#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-06-10 15:57:04
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-06-10 16:45:44

class SongsController < ApplicationController
  before_action :find_song, only: [:update, :destroy]

  def index
    @songs = Song.order('created_at ASC')
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      render json: @song
    else
      render status: 400, nothing: true
    end
  end

  def update
    if @song.update(song_params)
      render nothing: true, status: 200
    else
      render nothing: true, status: 400
    end
  end

  def destroy
    if @song.destroy
      render json: {}
    else
      render status: 400, nothing: true
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist, :preview_url)
  end

  def find_song
    @song = Song.find(params[:id])
  end
end
