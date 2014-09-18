#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-14 15:59:59
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-14 17:14:16

class CarsController < ApplicationController

  def index
    @cars = Car.all
    render :index
  end

  def new
    render :new
  end

  def create
    Car.create(color: params[:color], make: params[:make], model: params[:model], year: params[:year], image_url: params[:image_url])
    redirect_to '/cars'
  end

  def show
    @car = Car.find(params[:id])
    render :show
  end

  def edit
    @car = Car.find(params[:id])
    render :edit
  end

  def update
    Car.find(params[:id]).update(color: params[:color], make: params[:make], model: params[:model], year: params[:year], image_url: params[:image_url])
    redirect_to ('/cars/' + params[:id].to_s)
  end

  def destroy
    Car.find(params[:id]).destroy
    redirect_to '/cars'
  end

end
