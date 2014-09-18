class PinsController < ApplicationController

  def index
    @pins = Pin.all
    respond_to do |format|
      format.json {render json: @pins}
      format.html
    end
  end

  def new
  end

  def create
  end

end
