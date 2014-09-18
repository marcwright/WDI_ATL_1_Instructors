class PinsController < ApplicationController

# You should implement INDEX and CREATE methods for your Pin, both of which should respond with JSON.
# You will also need to decide on where your app's main content will live. In mine, I used NEW as the main page of the app, but it doesn't really matter.

  def index
  end

  def create
    binding.pry
    @pin = Pin.new(pin_params)
  end

  private

  def pin_params
    params.require(:pin).permit(:latitude, :longitude)
  end

end
