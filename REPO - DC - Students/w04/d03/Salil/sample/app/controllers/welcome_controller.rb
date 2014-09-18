class WelcomeController < ApplicationController

  def index
    render :index
  end

  def about
    render :about
  end

  def pizza_planet
    render :pizza_planet
  end

  def delivery
    render :delivery
  end

end
