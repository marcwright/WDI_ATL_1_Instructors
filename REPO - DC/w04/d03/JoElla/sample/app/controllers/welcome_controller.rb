class WelcomeController < ApplicationController

  def index
    render :index
  end

  def about
    render :about
  end

  def kittens
    render :kittens
  end

  def puppies
    render :puppies
  end

end
