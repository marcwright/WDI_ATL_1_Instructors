class WelcomeController < ApplicationController

  def index
    render :index
  end

  def about
    render :about
  end

  def faq
    render :faq
  end

  def contact
    render :contact
  end

end
