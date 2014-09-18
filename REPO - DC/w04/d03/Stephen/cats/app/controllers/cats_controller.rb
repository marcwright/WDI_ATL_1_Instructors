#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-14 13:44:22
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-14 15:29:26

class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def new
    render :new
  end

  def create
    Cat.create(name: params[:name], image_url: params[:image_url])
    redirect_to '/cats'
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

end
