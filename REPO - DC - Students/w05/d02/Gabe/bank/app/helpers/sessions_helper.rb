module SessionsHelper

  # Current User methods==========================================:

  #current user: the remember token is taken from  a
  # users cookies
  # and hashed (a method defined in User.) the output is
  # set equal to 'remember token'. Next the variable
  # @curren_user is assumed to be the user from our
  # DB for which they have a matching hash. we ask ourselves
  # does their hashed remember token match our hashed token?
  def current_user
    remember_token = User.hash(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  #Sets variable @current_user equal to 'user' for use outside these methods.
  def current_user=(user)
    @current_user = user
  end

  #tells us if a passed-in user is a current user.
  def current_user?(user)
    current_user == user
  end

  # Signin Status methods===========================================:

  # checks to see if there is no current user (if there is no-one signed in)
  def signed_in?
    !current_user.nil?
  end

  #creates a new remember token.
  #puts the token in cookies
  #updates our user DB with a hash digest of the token too.
  #runs .current_user on the signer-in and calls it 'user'.
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))
    self.current_user = user
  end

  #creates a new, non-matchin token, hashes it, and puts
  #it in our list of current users.
  #then deletes cookie on broswer side.
  #then deletes 'current_user'
  def sign_out
    current_user.update_attribute(:remember_token, User.hash(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  # Location Management methods===========================================:

  #if we get a request for a url
  #we store it in 'return_to' hash.
  def store_location
    if request.get?
      session[:return_to] = request.url
    end
  end

  #redirect_back_to will check our return-to hash and
  # direct us to our latest requested target, or a default, if
  # no original url request is found.
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  # Security Checkpoint method===========================================:

  #if a non signed-in user tries to visit a page,
  # it stores their location, for later redirect, then
  # flashes an error and brings you to the signin url.

  def require_signin
    unless signed_in?
      store_location
      flash[:error] = 'Please sign in.'
      redirect_to signin_url
    end
  end
end
