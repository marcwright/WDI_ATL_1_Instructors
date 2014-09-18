#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-14 13:44:22
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-14 14:44:15

class WelcomeController < ApplicationController

  def index
    @cats = Cat.all
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
