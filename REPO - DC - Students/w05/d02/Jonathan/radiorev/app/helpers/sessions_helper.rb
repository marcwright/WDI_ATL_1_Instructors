
# Still not completely clear on what a
# module does but believe that they are
# used to store 'global' methods assigned
# to all controllers or specific controllers

module SessionsHelper

# The "current_user" methods are a set of
# methods that track the user's login status
# during the browser session

  # Method defining the current user as the
  # user we are looking for
  def current_user
    @current_user = user
  end

  # Method confirming that the user we found
  # is the "current user"
  def current_user=(user)
    current_user == user
  end

  # Method checking to see if the "current user"
  # is the one we were looking for
  def current_user?(user)
    current_user == user
  end

end

# The "Signin Status" methods confirm that
# the current user is signed-in, creates a
# cookie if they choose to store it and
# allows the user to remove the cookie so
# the app will not store private login info
# on a poential 'public' computer.

  # Checks to see if current user is signed-in
  def signed_in?
    !current_user.nil?
  end

  # Adds a new or overrides cookie if user wants to be
  # remembered, stores that cookie with the
  # browser memory and saves that cookie with
  # the current user account
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))
    self.current_user = user
  end

  # Removes the cookie from the broswer memory
  def sign_out
    current_user.update_attribute(:remember_token, User.hash(remember_token)))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

# Require signin governs the entire process
# and ensures that a user is logged-in
# before being able to view information

  def require_signin
    unless signed-in?
      # store_location stores the cookie
      # in the browser's memory
      store_location
      flash[:error] = "Please sign-in"
      redirect_to signin_url
    end
  end
end #SessionsHelper
