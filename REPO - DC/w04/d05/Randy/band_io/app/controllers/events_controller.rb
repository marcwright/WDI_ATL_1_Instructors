class EventsController < ApplicationController

  before_action :find_event, only: [:show, :edit, :update, :destroy]
  before_action :create_band_list, only: [:new, :edit]

 def index
    @events = Event.where(venue_id: params[:venue_id])
  end

  def new
    @venue = Venue.find(params[:venue_id])
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    redirect_to @event
  end

  def show
  end

  def edit
  end

  def update
    @event = Event.new
    @event.update(event_params)
    redirect_to @event
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end


  private
    def event_params
      params.require(:event).permit(:date, :time, :band_id, :venue_id)
    end

    def find_event
      @event = Event.find(params[:id])
    end

    def create_band_list
      @bands = []
      Band.all.each do |band|
        @bands.push([band.name, band.id])
      end
    end

end
