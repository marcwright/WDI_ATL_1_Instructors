module SessionsHelper

  # The current user who is signed in
  def current_user
    # Hashes remember_token on our side, user has real token
    remember_token = User.hash(cookies[:remember_token])
    # Grabs current_user info for use
    @current_user ||= User.find_by(remember_token: remember_token)
    # @current_user = @current_user || User.find_by(remember_token: remember_token)
  end

  # Sets the current user who is logged in
  def current_user=(user)
    @current_user = user
  end

  # Detemines whether the given user is the current user.
  def current_user?(user)
    current_user == user
  end

  # Signs in a user by issuing them a remember_token
  def sign_in(user)
    # Issues new random piece of text (aka remember token) to user
    remember_token = User.new_remember_token
    # Giving user plain text token
    cookies.permanent[:remember_token] = remember_token
    # Hashing our DB version of the remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))
    self.current_user = user
    # Sets logged in user as current_user
  end

  # Signs out the user by destroying their remember_token
  def sign_out
    # Setting current user's remember token to a new hash that is invalid
    # The idea is to make every record in the table look identical
    current_user.update_attribute(:remember_token, User.hash(User.new_remember_token))
    # Deletes current user's remember_token from the hash
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  # Does the session have a signed in user?
  def signed_in?
    !current_user.nil?
  end

  # Store an un-authenticated user's target destination
  # so we can forward them there later.
  def store_location
    # Stores location in Session
    if request.get?
      session[:return_to] = request.url
    end
  end

  # Redirects to user's stored location, or to a default url
  def redirect_back_or(default)
    # send back to what was stored in 'session[:return_to] or the default location
    redirect_to(session[:return_to]  || default)
    # deletes saved return location
    session.delete(:return_to)
  end

  # "Where rubber meets road"
  # Requires user to sign in before proceeding.
  def require_signin
    unless signed_in?
      store_location
      flash[:error] = "Please sign in to continue"
      redirect_to signin_url
    end
  end
end
