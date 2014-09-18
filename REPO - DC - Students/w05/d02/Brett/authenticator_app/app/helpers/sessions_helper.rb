module SessionsHelper

  # Current user methods:

  def current_user
    remember_token = User.hash(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user?(user)
    current_user == user
  end

  # Sign-in status methods:

  def signed_in?
    !current_user.nil?
  end

  def sign_in(user)
    # generating a new token
    remember_token = User.new_remember_token
    # saving the token on the client side
    cookies.permanent[:remember_token] = remember_token
    # hashing the token and saving in our db
    user.update_attributes(remember_token: User.hash(remember_token))
    self.current_user = user
  end

  def sign_out
    # set a new placeholder hash in our db to match others
    current_user.update_attributes(remember_token: User.hash(User.new_remember_token))
    # delete the token on the client end
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  # Location management methods:

  def store_location
    if request.get?
      session[:return_to] = request.url
    end
  end

  def redirect_back_or(default)
    redirect_to( :session[:return_to] || default )
    session.delete(:return_to)
  end

  # Security checkpoint method:
  def require_signin
    unless signed_in?
      store_location
      flash[:notice] = "Please sign in."
      redirect_to signin_url
    end
  end
end
