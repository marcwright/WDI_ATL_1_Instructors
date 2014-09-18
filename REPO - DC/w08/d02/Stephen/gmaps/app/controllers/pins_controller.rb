#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-06-11 06:59:03
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-06-11 09:12:38

class PinsController < ApplicationController

  def index
  end

  def get_all
    @pins = Pin.order('created_at ASC')
    render json: @pins
  end

  def create
    @pin = Pin.new(pin_params)
    if @pin.save
      render json: @pin
    else
      render status: 400, nothing: true
    end
  end

  private

  def pin_params
    params.require(:pin).permit(:lat, :long)
  end

end
