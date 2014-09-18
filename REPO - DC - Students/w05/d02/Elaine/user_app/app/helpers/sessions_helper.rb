module SessionsHelper

  # Current User methods:

  def current_user
    # Note the current remember token.
    remember_token = User.hash(cookies[:remember_token])
    # If the current user has been identified, remember his identity. If not, locate him by the user token.
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user=(user)
    # Identify the user detected as the current user.
    @current_user = user
  end

  def current_user?(user)
    # Check to see if the current user in the system is the person currently using the site.
    current_user == user
  end

  # Signin Status methods:

  def signed_in?
    # Check to see if there is no current user identified.
    !current_user.nil?
  end


  def sign_in(user)
    # Create a new remember token for the user and save a hash of this as the user's attribute.
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))
    self.current_user = user
  end

  def sign_out
    # Set a random hash to the user's remember token. Then delete the remember token stored in the cookie. Set the current user to no one.
    current_user.update_attribute(:remember_token, User.hash(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  # Location Management methods:

  def store_location
    # If the browser was in the middle of processing a get request, store the request url as return_to s.
    if request.get?
      session[:return_to] = request.url
    end
  end

  def redirect_back_or(default)
    # Either redirect the user to the destination of his last get request, or go to the default site. Clear the return_to url.
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  # Security Checkpoint method:

  def require_signin
    # If the user isn't signed in, save the destination of his get request. Redirect the user to the signin page, and show an error.
    unless signed_in?
      store_location
      flash[:error] = 'Please sign in.'
      redirect_to signin_url
    end
  end





end
