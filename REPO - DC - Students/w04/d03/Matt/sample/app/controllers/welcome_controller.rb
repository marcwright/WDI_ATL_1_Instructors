class WelcomeController < ApplicationController
  def index
    render :index
  end

  def about
    render :about
  end

  def contact
    render :contact
  end

  def party
    render :party
  end
end
