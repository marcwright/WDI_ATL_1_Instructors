class VenuesController < ActionController::Base
  before_action :find_venue, only: [:show, :destroy]
  def index
    @venues = Venue.all.order(:name)
  end

  def show
    @events = @venue.events
    @event = Event.new
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.create(venue_params)
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
    params.require(:venue).permit(:name, :city, :state, :allows_explicit_lyrics )
  end
end
