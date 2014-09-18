class EventsController < ApplicationController
  before_action :find_venue, only: [:index, :new, :create]

  def index
    @events = Venue.find(params[:venue_id]).events
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @bands = Band.all
    @event = Event.new
  end

  def create
    @venue.events.create(event_params)
    redirect_to "/venues/#{params[:venue_id]}/events"
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to "/events/#{params[:id]}"
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to "/venues/#{params[:id]}/events"
  end

  private

  def find_venue
    @venue = Venue.find(params[:venue_id])
  end

  def event_params
    params.require(:event).permit(:date, :time, :band_id)
  end

end
