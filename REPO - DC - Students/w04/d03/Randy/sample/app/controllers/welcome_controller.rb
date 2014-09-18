class WelcomeController < ApplicationController

  def index
    render :index
      # render is the rail equivalent of erb in sinatra
  end

  def about
    render :about
  end

  def contact
    render :contact
  end

  def complaints
    render :complaints
  end
end
