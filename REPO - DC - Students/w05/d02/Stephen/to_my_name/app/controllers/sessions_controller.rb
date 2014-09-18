#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-20 19:15:20
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-20 20:37:19

class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
    else
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
