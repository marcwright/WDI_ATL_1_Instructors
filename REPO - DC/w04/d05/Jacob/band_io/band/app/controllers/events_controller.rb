class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    redirect to @event
  end

  def show
  end

  def destroy
    @event.destroy
    redirect_to venue_events_path(@event.venue_id)
  end

  private

  def venue_params
    params.require(:event).permit(:date, :time, :venue_id, :band_id)
  end

end
