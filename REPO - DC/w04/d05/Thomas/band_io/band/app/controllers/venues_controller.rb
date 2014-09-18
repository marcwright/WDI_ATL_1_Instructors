class VenuesController < ApplicationController

#why is the below the same as typing root/venues?
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.create(venue_params)
    redirect_to @venue
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :city, :state, :allows_profanity)
  end

end
