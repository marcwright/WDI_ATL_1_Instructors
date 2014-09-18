class WelcomeController < ApplicationController

  def index
    render :index
  end

  def about
    render :about
  end

  def yoga
    render :yoga
  end

  def puppy
    render :puppy
  end
end
