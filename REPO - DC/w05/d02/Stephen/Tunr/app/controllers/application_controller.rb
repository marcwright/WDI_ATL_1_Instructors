#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-20 16:40:03
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-20 17:13:35

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  include SessionsHelper # since other controllers inherit, this will make SessionsHelper available everywhere
end
