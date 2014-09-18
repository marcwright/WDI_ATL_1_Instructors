class WdiRostersController < ApplicationController

  def index
    @wdi_rosters = WdiRoster.all
    render :index
  end

  def new
    render :new
  end

  def create
    WdiRoster.create(
      name: params[:name],
      email: params[:email],
      image_url: params[:image_url]
      )
    redirect_to '/wdi_rosters'
  end

end

