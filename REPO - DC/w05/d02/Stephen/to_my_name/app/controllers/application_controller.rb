#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-20 18:14:32
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-20 19:31:36

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
end
