module SessionsHelper
  # Gets the current user from the remember token
  def current_user
    remember_token = User.hash(cookies[:remember_token])           # gets the hash of the remember token cookie
    @current_user ||= User.find_by remember_token: remember_token  # looks up the user based on their remember token, if there is no current user set
  end

  def current_user=(user)
    @current_user = user
  end

  # determines if a given user is the current user
  def current_user?(user)
    current_user == user
  end

  # signs in a user by issuing a remember_token
  def sign_in(user)
    remember_token = User.new_remember_token                          # create a new remember token
    cookies.permanent[:remember_token] = remember_token               # save the remember token on the client side as a cookie
    user.update_attributes remember_token: User.hash(remember_token)  # save the remember token on the server side in the DB
    self.current_user = user
  end

  # signs out a user by destroying a remember token
  def sign_out(user)
    current_user.update_attributes remember_token: User.hash(User.new_remember_token)   # overwrite the user's current remember token
    cookies.delete :remember_token                                                      # delete the user's cookie
    self.current_user = nil                                                             # forget the current user
  end

  def signed_in?
    !current_user.nil?
  end

  # store an un-authenticated user's target destination
  # so that we can forward them there after they authenticate
  def store_location
    session[:return_to] = request.url if request.get?
  end

  # redirect to user's stored location or to a default url
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete :return_to 
  end

  # requires the user to sign in before proceeding
  def require_signin
    unless signed_in?
      store_location
      flash[:notice] = "Please sign in to continue"
      redirect_to signin_path
    end
  end
end
