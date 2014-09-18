class VenuesController < ApplicationController
  before_action :find_venue, only: [:show, :destroy]
  #Allows you to find a method that is common to the methods, break it out into its own method
  #(in this case 'find_venue'), and then call it ahead of time using 'before_action', specifying in
  #the 'only:' array which methods it applies to.
  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.create(venue_params)
    redirect_to @venue
  end

  def show
  end

  def destroy
    @venue.destroy
    redirect_to venues_path
  end

  private

  def find_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name, :city, :state, :allows_profanity)
  end

end
