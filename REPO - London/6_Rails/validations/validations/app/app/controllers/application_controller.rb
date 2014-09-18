class ApplicationController < ActionController::Base
  protect_from_forgery

  def home
    x = 12
    @y = 45
    binding.pry
    1/0
    render text: "here"
  end
end
