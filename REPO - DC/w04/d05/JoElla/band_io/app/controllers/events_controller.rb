class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(
      band_id: params
      )
    redirect_to @event
  end

private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:date, :time, :venue_id, :band_id)
  end

end


