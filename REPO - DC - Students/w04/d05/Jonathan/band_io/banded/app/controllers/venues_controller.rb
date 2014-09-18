class VenuesController < ApplicationController
  before_action :find_venue, only: [:show, :edit, :update, :destroy]


  # def family
  #   if (params[:allows_explicit_lyrics]) == true
  #     puts "Yes"
  #   end
  # end

  def index
    @venues = Venue.all

    if params[:allows_explicit_lyrics] == false
     puts "yes"
    else
     puts "no"
    end

    render :index
  end

  def new
    @venue = Venue.new
  end

  def create
  end

  def show
    # @venue = Venue.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_venue
    @venue = Venue.find(params[:id])
  end

end
