class EventsController < ApplicationController

def index
 @venue= Venue.all
  @band = Band.all
  if params[:search]
    @events = Event.search(params[:search])
  else
    @events = Event.all
  end
end

  def new
    @event = Event.new
    @band = Band.all
    @venue = Venue.all
  end

  def create
    @event=Event.create(event_params)
    redirect_to @event
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:date, :time, :band_id, :venue_id)
  end

end
