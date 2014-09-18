class WelcomeController < ApplicationController

  def index
    render :index
  end

  def about
    render :about
  end

  def photo
    render :photo
  end

  def poems
    render :poems
  end

end
