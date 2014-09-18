class WelcomeController < ApplicationController

  def index
    @entries = Entry.all
    render :index
  end
end
