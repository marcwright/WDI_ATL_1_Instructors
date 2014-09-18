class EventsController < ActionController::Base
  before_action :find_event, only: [:show, :destroy]
  before_action :find_venue, only: [:new, :create, :show]

  def index
    @events = Event.where(venue_id: params[:venue_id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = @venue.events.new(params_event)

    if @event.save
      redirect_to @event
    else
      render "new"
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private
  def find_event
    @event = Event.find(params[:id])
  end

  def find_venue
    @venue = Venue.find(params[:venue_id] || params[:id])
  end

  def params_event
    params.require(:event).permit( :date, :time, :venue_id, :band_id )
  end
end
