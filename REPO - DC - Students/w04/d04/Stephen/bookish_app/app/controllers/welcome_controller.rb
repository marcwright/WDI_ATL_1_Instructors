class WelcomeController < ActionController::Base

  def index
    redirect_to "/authors"
  end

end
