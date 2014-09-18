##############################################
#!/usr/bin/ruby
# @Author: Richard Hessler
# @Date:   2014-06-10 15:51:07
# @Last Modified by:   Richard Hessler
# @Last Modified time: 2014-06-10 16:36:59
##############################################

class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def create

  end

  def destroy
    @song = Song.find(params[:id])
    if @song.destroy
      render json: { } # sends back an empty object to receive call back function
    else
      render status: 400, nothing: true
    end
  end

  private

  def characters_params
    params.require(:song).permit(:artist, :song_title, :preview_url)
  end
end
