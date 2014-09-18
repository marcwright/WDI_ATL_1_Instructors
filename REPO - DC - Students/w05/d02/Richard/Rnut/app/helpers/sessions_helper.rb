module SessionsHelper

  # Defines the current user who is signed
  def current_user
    # Hashes remember_token on our side, user has unhashed version
    remember_token = User.hash(cookies[:remember_token])
    # Grabs current_user infor for use
    # Same as @current_user = @current_user || User.find_by(remember_token: remember_token)
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  # Getting that sets the current user to who is logged in
  def current_user=(user)
    @current_user = user
  end

  # Determines wheter the given user is the current user.
  def current_user?(user)
    current_user == user
  end

  # Signs in a user by issuing them a remember_token
  def sign_in(user)
    # Issues new random piece of text (aka
    # remember_token) to user
    remember_token = User.new_remember_token
    # Giving user plain text token
    cookies.permanent[:remember_token] = remember_token
    # Hashing the version of the remember_token which the host maintains.
    user.update_attribute(:remember_token, User.hash(remember_token))
    #sets the one who signed in (user) to current user
    self.current_user=user
  end

  # Signs out the user by destroying their remember_token
  def sign_out
    #Setting current user's remember_token to a
    #new hash that is in valid
    #The idea is to make every record in the
    #table to look identical in an attempt to
    #thwart evil
    current_user.update_attribute(:remember_token, User.hash(User.new_remember_token))
    #Deletes current user's remember_token from hash
    cookies.delete(:remember_token)
    #sets current use to empty
    self.current_user = nil
  end

  # Validates whether or not the session has a
  # signed in user.
  def signed_in?
    !current_user.nil?
  end

  # Store an un-authenticated user's target
  # destination so we may forward them there
  # later
  def store_location
    #stores location in Session
    if request.get?
      session[:return_to] = request.url
    end
  end

  #Redirects to user's stored location, or to a
  #default url
  def redirect_back_or(default)
    #send back to what was stored in
    #"session[:return_to] or default location
    redirect_to(session[:return_to] || default)
    #deletes saved return location
    session.delete(:return_to)
  end

  # Requires the user to sign in before being
  # able to view pages within site
  # If not signed in, flash error and redirect
  # user to sign in.
  def require_signin
    unless signed_in?
      store_location
      flash[:error] = "Please sign in to continue"
      redirect_to signin_url
    end
  end
end
