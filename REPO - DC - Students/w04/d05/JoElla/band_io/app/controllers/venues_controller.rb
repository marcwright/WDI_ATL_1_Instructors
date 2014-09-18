class VenuesController < ApplicationController
  before_action :find_venue, only: [:show, :edit, :update, :destroy]


  def index
    @venues = Venue.all
  end

  def show
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.create(venue_params)
    redirect_to @venue
  end

  def edit
  end

  def update
    @venue.update(venue_params)
    redirect_to @venue
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
    params.require(:venue).permit(:name, :city, :state, :allows_explicit_lyrics)
  end

end
