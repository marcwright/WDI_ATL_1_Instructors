#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-16 15:49:37
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-16 19:38:58

class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]
  before_action :prepare_bands
  before_action :prepare_venues

  def index
    @events = Event.all
  end

  # Pass an empty venue
  def new
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
    @event.update(event_params)
    redirect_to @event
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  # Security measure that builds white-listed params object to send over
  def event_params
    params.require(:event).permit(:date, :time, :venue_id, :band_id)
  end

  def prepare_bands
    @bands = Band.all
  end

  def prepare_venues
    @venues = Venue.all
  end

end
