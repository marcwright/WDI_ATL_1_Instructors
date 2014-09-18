class VenuesController < ApplicationController

  def index
    redirect_to '/events'
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue=Venue.create(venue_params)
    redirect_to @venue
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name, :city, :state, :allows_explicit_lyrics)
  end

end
