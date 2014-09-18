#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-20 16:40:03
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-20 17:10:47

module SessionsHelper

  # Current User methods:

  # indicates the current user based on the remember token (or stored value)
  def current_user
    remember_token = User.hash(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  # sets the current user for the session equal to a specified user
  def current_user=(user)
    @current_user = user
  end

  # checks whether the current user is a specified user
  def current_user?(user)
    current_user == user
  end

  # Signin Status methods:

  # indicates whether there is a user currently signed in
  def signed_in?
    !current_user.nil?
  end

  # signs in a specified user by storing a hash of their remember token
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))
    self.current_user = user
  end

  # signs out a specified user by storing a hash of a new (non-working)
  # remember token
  def sign_out
    current_user.update_attribute(:remember_token, User.hash(User.new_remember_token))
    cookies.delete(:remember_token) # takes away the stored cookie
    self.current_user = nil # don't have a current user anymore
  end

  # Location Management methods:

  # keep track of where the user wants to go
  def store_location
    if request.get?
      session[:return_to] = request.url # target URL the user is after
    end
  end

  # points the user where he/she wants to go, deletes that stored URL
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  # Security Checkpoint method:

  # can be used to block access to specified pages until user is signed in
  def require_signin
    unless signed_in?
      store_location # memo re: where to go
      flash[:error] = 'Please sign in.' # helpful error message
      redirect_to signin_url # let the user login
    end
  end
end
