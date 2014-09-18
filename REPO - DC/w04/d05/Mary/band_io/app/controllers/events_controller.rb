class EventsController < ApplicationController
  def index
    @events = Event.where(venue_id: params["venue_id"])
    @venue = Venue.find(params["venue_id"])
  end

  def search
    @date = params[:date]
    @events = Event.where(date: @date)
  end

  def show
    @event = Event.find(params[:id])
    @venue = Venue.find(params["venue_id"])
  end

  def new
    @event = Event.new
    @venue = Venue.find(params[:venue_id])
    if @venue.allows_explicit_lyrics == false
      @bands = Band.where(explicit_lyrics: false)
    else
      @bands = Band.all
    end
  end

  def create
    @event = Event.create(event_params)
    @event.update(venue_id: params[:venue_id])
    redirect_to venue_events_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to venues_path
  end

  def edit
  end

  def update
  end

  private
  def event_params
    params.require(:event).permit(:date, :time, :band_id)
  end
end
