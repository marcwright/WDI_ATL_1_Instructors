class PinsController < ApplicationController

  def index
    @pins = Pin.all
  end

  def create
  end

end
