class WelcomeController < ApplicationController

  def index
  end

  def vacation
    @vacation = Vacation.find_by_slug params[:slug]
  end

end