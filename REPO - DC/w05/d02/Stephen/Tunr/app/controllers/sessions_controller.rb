#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-20 16:40:03
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-20 17:15:12

# this will controller the various session behaviors
class SessionsController < ApplicationController
  def new
  end

  # will start a new session if the user authenticates, otherwise error
  def create
    # Find the user by email:
    user = User.find_by(email: params[:session][:email].downcase)

    # Test if the user was found AND authenticates
    if user && user.authenticate(params[:session][:password])
      sign_in user #do all the remember token stuff
      redirect_back_or root_url # point to a useful place
    else
      flash[:error] = 'Invalid email/password' # helpful error display
      redirect_to new_session_path # try again
    end
  end

  # signs the user out and goes back to the root of the site
  def destroy
    sign_out
    redirect_to root_url
  end
end
