#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-14 12:02:10
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-14 12:13:50

class WelcomeController < ApplicationController

  def index
    render :index
  end

  def about
    render :about
  end

  def links
    render :links
  end

  def contact
    render :contact
  end

end
