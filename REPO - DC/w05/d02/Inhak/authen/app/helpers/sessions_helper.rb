module SessionsHelper

  def current_user
    remember_token = User.hash(cookies[:remember_token])
    # this is a single lookup and cache value system. It
    # either returns the value @current_user if it has it, and if
    # it doesn't, it makes sure the current user gets set to the user found
    # by the remember token.
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user=(user)
    #sets the argument to the instance variable current user.
    @current_user = user
  end

  # determines if the given user is the current user.
  def current_user?(user)
    current_user == user
  end

  # Checks to see that eh current user variable is filled.
  def signed_in?
    !current_user.nil?
  end

  # makes a remember token and stores it in the cookie
  # on the client side. It then updates user attributes
  # with the new remember token and the hash of the token.
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))
    self.current_user = user
  end

  # signing out destroys the cookie and changes the
  # remember token.
  def sign_out
    current_user.update_attribute(:remember_token, User.hash(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  # returns user to the page they were at.
  def store_location
    if request.get?
      session[:return_to] = request.url
    end
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def require_signin
    unless signed_in?
      store_location
      flash[:notice] = "Please sign in to continue"
      redirect_to signin_url
    end
  end
end
