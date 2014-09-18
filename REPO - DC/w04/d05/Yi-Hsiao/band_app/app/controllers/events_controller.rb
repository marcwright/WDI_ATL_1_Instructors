class EventsController < ApplicationController
  def index
    current_time = DateTime.now.strftime('%Y-%m-%d %H:%M:%S')

    # display only future events, sorted by soonest to latest
    @events = Event.where("date_time > '#{ current_time }'").order(:date_time)
  end
end
