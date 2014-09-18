#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-20 19:15:20
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-20 20:33:01

module SessionsHelper

  def current_user
    remember_token = User.digest(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user=(user)
    @current_user = user
  end

  # checks whether the current user is a specified user
  def current_user?(user)
    current_user == user
  end

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    current_user.update_attribute(:remember_token, User.digest(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

end
