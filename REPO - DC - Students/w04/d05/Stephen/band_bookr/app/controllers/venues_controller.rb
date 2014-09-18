#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-16 15:49:37
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-16 15:57:38

class VenuesController < ApplicationController
  before_action :find_venue, only: [:show, :edit, :update, :destroy]

  def index
    @venues = Venue.all
  end

  # Pass an empty venue
  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.create(venue_params)
    redirect_to @venue
  end

  def show
  end

  def edit
  end

  def update
    @venue.update(venue_params)
    redirect_to @venue
  end

  def destroy
    @venue.destroy
    redirect_to venues_path
  end

  private

  def find_venue
    @venue = Venue.find(params[:id])
  end

  # Security measure that builds white-listed params object to send over
  def venue_params
    params.require(:venue).permit(:name, :city, :state, :allows_explicit_lyrics)
  end

end
