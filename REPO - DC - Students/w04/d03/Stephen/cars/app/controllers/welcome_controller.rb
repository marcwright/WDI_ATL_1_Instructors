#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-14 15:50:44
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-14 16:55:10

class WelcomeController < ApplicationController

  def index
    @cars = Car.all
    render :index
  end

end
