class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    if params[:venue_id]
      @events = Event.where(venue_id: params["venue_id"])
      @venue = Venue.find(params[:venue_id])
    elsif params[:band_id]
      @events = Event.where(band_id: params["band_id"])
      @venue = Venue.find(params[:band_id])
    end
  end

  def show
  end

  def new
    @venue_id = params[:venue_id]
    @venue = Venue.find(params[:venue_id])

    @bands = Band.all
  end

  def create

    @venue = Venue.find(params[:venue_id])

    @event = Event.create(date: params[:date], time: params[:time], venue_id: params[:venue_id], band_id: :band_id)

    redirect_to ("/venues/#{params[:venue_id]}/events")

  end

  def destroy
    @event.destroy
    if params[:venue_id]
      redirect_to ("/venues/#{params[:venue_id]}/events")
    elsif params[:band_id]
      redirect_to ("/bands/#{params[:band_id]}/events")
    end

  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:hero).permit(:date, :time, :band_id)
  end
end
